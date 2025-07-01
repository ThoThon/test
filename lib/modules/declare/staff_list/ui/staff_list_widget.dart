part of 'staff_list_page.dart';

extension StaffListWidget on StaffListPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.defaultPadding,
              horizontal: AppDimens.defaultPadding,
            ),
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSBuildText(
                      'Danh sách nhân viên',
                      style: AppTextStyle.font16Bo,
                    ),
                    _buildListStaff(),
                    _buildSelectImage(),
                    _buidHideImage(),
                  ],
                );
              },
            ),
          ),
        ),
        _buildSubmitButton().paddingAll(AppDimens.defaultPadding),
      ],
    );
  }

  Widget _buidHideImage() {
    return Obx(
      () {
        if (controller.listAttachImage.isEmpty) {
          return const SizedBox.shrink();
        }
        return Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: AppColors.dsGray5,
            ),
            borderRadius: BorderRadius.circular(AppDimens.radius8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: List.generate(
              controller.listAttachImage.length,
              (index) {
                final imageAttach = controller.listAttachImage[index];
                return Row(
                  children: [
                    Image.network(
                      imageAttach.imgPath,
                      fit: BoxFit.cover,
                      height: 80,
                      width: 80,
                    ),
                    sdsSBWidth8,
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SDSBuildText(
                            controller.getFileName(imageAttach.fileName),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        controller.deteleImage(
                          controller.getFileNameFromUrl(imageAttach.imgPath),
                          index,
                        );
                      },
                      icon: SDSImageSvg(
                        Assets.ASSETS_ICONS_IC_REMOVE_SVG,
                        width: AppDimens.sizeIconMedium,
                        height: AppDimens.sizeIconMedium,
                      ),
                    ),
                  ],
                ).paddingSymmetric(vertical: AppDimens.paddingSmall);
              },
            ),
          ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
        ).paddingOnly(
          top: AppDimens.paddingVerySmall,
        );
      },
    );
  }

  Widget _buildSelectImage() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        SDSBuildText(
          LocaleKeys.declarationPeriodDetail_attachFile.tr,
          style: AppTextStyle.font16Bo,
        ),
        UtilWidget.sizedBox8,
        InkWell(
          onTap: () {
            controller.listAttachImage.length < 5
                ? Get.bottomSheet(
                    UtilWidget.buildBottomSheetFigma(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                // Close the bottom sheet
                                Get.back();
                                controller.takePhoto();
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.camera_alt_outlined),
                                  UtilWidget.sizedBoxWidth8,
                                  Expanded(
                                    child: SDSBuildText(
                                      'Chụp ảnh từ camera',
                                      style: AppTextStyle.font16Semi,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(
                                vertical: AppDimens.defaultPadding,
                              ),
                            ),
                          ),
                          const Divider(height: 1),
                          Material(
                            color: Colors.white,
                            child: InkWell(
                              onTap: () {
                                // Close the bottom sheet
                                Get.back();
                                controller.pickImage();
                              },
                              child: Row(
                                children: [
                                  const Icon(Icons.image_outlined),
                                  UtilWidget.sizedBoxWidth8,
                                  Expanded(
                                    child: SDSBuildText(
                                      'Chọn ảnh từ điện thoại',
                                      style: AppTextStyle.font16Semi,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(
                                  vertical: AppDimens.defaultPadding),
                            ),
                          ),
                          UtilWidget.sizedBox16,
                        ],
                      ),
                    ),
                  )
                : controller.maximumUploadFile();
          },
          borderRadius: BorderRadius.circular(8),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: Colors.grey,
                width: 1,
              ),
            ),
            child: Row(
              children: [
                const Icon(Icons.image_outlined, size: 48),
                UtilWidget.sizedBoxWidth8,
                SDSBuildText(
                  LocaleKeys.declarationPeriodDetail_addAttachedImage.tr,
                  style: AppTextStyle.font16Re,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildListStaff() {
    final isListStaffEmpty = controller.declaredStaffs.isEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isListStaffEmpty)
          SDSBuildText(
            "Chưa có nhân viên nào được khai báo",
            style: AppTextStyle.font16Re,
          ).paddingAll(AppDimens.defaultPadding),
        ...addSeparator(
          spacer: const SizedBox.shrink(),
          children: controller.declaredStaffs.map(
            (staff) {
              return _buildStaffItem(staff);
            },
          ),
        ),
        // UtilWidget.buildDividerDefault(),
        // _buildAddNewStaff(),
      ],
    );
  }

  Widget _buildStaffItem(DeclaredStaffModel staff) {
    return Slidable(
        key: ValueKey(staff.id),
        endActionPane: ActionPane(
          // A motion is a widget used to control how the pane animates.
          motion: const ScrollMotion(),
          children: [
            CustomSlidableAction(
              onPressed: (ctx) {
                controller.showDialogDeleteStaff(staff);
              },
              backgroundColor: AppColors.primaryColor,
              foregroundColor: Colors.white,
              child: SDSBuildText(
                LocaleKeys.app_delete.tr,
                style: AppTextStyle.font20Bo.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.basicWhite,
            borderRadius: BorderRadius.circular(AppDimens.radius16),
          ),
          child: Column(
            children: [
              Row(
                children: [
                  SDSImageSvg(Assets.ASSETS_ICONS_IC_PERSONAL_SVG),
                  sdsSBWidth8,
                  SDSBuildText(
                    staff.name,
                    style: AppTextStyle.font16Bo,
                  ),
                  const Spacer(),
                  SDSImageSvg(Assets.ASSETS_ICONS_IC_DELETE_SVG),
                ],
              ),
              sdsSBHeight12,
              Row(
                children: [
                  const Expanded(child: SDSBuildText('')),
                  InkWell(
                      onTap: () {
                        controller.updateStaff(staff);
                      },
                      child: SDSBuildText(
                        'Chỉnh sửa',
                        style: AppTextStyle.font14Re.copyWith(
                          color: AppColors.primaryColor,
                        ),
                      )),
                ],
              ),
            ],
          ).paddingSymmetric(
            vertical: AppDimens.paddingSmall,
            horizontal: AppDimens.defaultPadding,
          ),
        )
        // InkWell(
        //   borderRadius: BorderRadius.circular(8),
        //   onTap: () {
        //     controller.updateStaff(staff);
        //   },
        //   child: Container(
        //     width: double.infinity,
        //     padding: const EdgeInsets.symmetric(
        //       vertical: AppDimens.defaultPadding,
        //       horizontal: AppDimens.paddingVerySmall,
        //     ),
        //     child: SDSBuildText(
        //       '${staff.name} ${staff.bhxhNumber.isNotEmpty ? "(${staff.bhxhNumber})" : ""}',
        //       style: AppTextStyle.font16Bo,
        //     ),
        //   ),
        // ),
        );
  }

  Widget _buildAddNewStaff() {
    return InkWell(
      onTap: () {
        EasyThrottle.throttle(
          'createStaff',
          const Duration(seconds: 1),
          () {
            controller.createStaff();
          },
        );
      },
      child: Row(
        children: [
          const CircleAvatar(
            backgroundColor: AppColors.primaryColor,
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
          UtilWidget.sizedBoxWidth8,
          SDSBuildText(
            LocaleKeys.declarationPeriodDetail_addNewStaff.tr,
            style: AppTextStyle.font16Semi.copyWith(
              color: Colors.grey,
            ),
          ),
        ],
      ).paddingSymmetric(vertical: AppDimens.defaultPadding),
    );
  }

  Widget _buildSubmitButton() {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
      height: AppDimens.btnLargeFigma,
      title: 'Tiếp theo',
      onPressed: controller.saveXml,
    );
  }
}
