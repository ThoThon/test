part of 'staff_list_page.dart';

extension StaffListWidget on StaffListPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              horizontal: AppDimens.defaultPadding,
            ),
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
        if (controller.listImage.isEmpty) {
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
              controller.listImage.length,
              (index) {
                final imageSelected = controller.listImage[index];
                return Row(
                  children: [
                    Image.file(
                      File(imageSelected),
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
                            controller.getFileName(imageSelected),
                            maxLines: 2,
                          ),
                          SDSBuildText(
                            controller.getImageSize(
                              File(imageSelected),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Spacer(),
                    IconButton(
                      onPressed: () {
                        controller.removeImage(index);
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
            controller.listImage.length < 5
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
                                      'Chụp ảnh từ cammera',
                                      style: AppTextStyle.font16Semi,
                                    ),
                                  ),
                                ],
                              ).paddingSymmetric(
                                  vertical: AppDimens.defaultPadding),
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
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...addSeparator(
          spacer: UtilWidget.sizedBox16,
          children: controller.declaredStaffs.map(
            (staff) {
              return InkWell(
                borderRadius: BorderRadius.circular(8),
                onTap: () {
                  // Nếu được mở từ màn Kê khai thông tin thì chỉ cần back về và chọn đúng tab
                  if (Get.previousRoute == AppRoutes.declareInfo.path) {
                    Get.back(
                      result: const StaffListResult(
                        action: StaffListResultAction.selectD02Tab,
                      ),
                    );
                  } else {
                    // Nếu chưa có thì đóng màn này và mở màn Kê khai thông tin
                    Get.offNamed(
                      AppRoutes.declareInfo.path,
                      arguments: const DeclareInfoArgument(
                          action: DeclareInfoAction.edit,
                          declarationPeriodId: ''),
                    );
                  }
                },
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(AppDimens.defaultPadding),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,
                    ),
                  ),
                  child: SDSBuildText(
                    '${staff.name} ${staff.bhxhNumber.isNotEmpty ? "(${staff.bhxhNumber})" : ""}',
                    style: AppTextStyle.font16Bo,
                  ),
                ),
              );
            },
          ),
        ),
        _buildAddNewStaff(),
      ],
    );
  }

  Widget _buildAddNewStaff() {
    return InkWell(
      onTap: () {
        // Nếu được mở từ màn Kê khai thông tin thì chỉ cần back về và chọn đúng tab
        if (Get.previousRoute == AppRoutes.declareInfo.path) {
          Get.back(
            result: const StaffListResult(
              action: StaffListResultAction.selectD02Tab,
            ),
          );
        } else {
          // Nếu chưa có thì đóng màn này và mở màn Kê khai thông tin
          Get.offNamed(
            AppRoutes.declareInfo.path,
            arguments: const DeclareInfoArgument(
              action: DeclareInfoAction.edit,
              declarationPeriodId: '',
            ),
          );
        }
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
      height: AppDimens.btnLargeFigma,
      title: 'Tiếp theo',
      onPressed: () {
        Get.toNamed(AppRoutes.declarationList.path);
      },
    );
  }
}
