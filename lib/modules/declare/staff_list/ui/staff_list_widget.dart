part of 'staff_list_page.dart';

extension StaffListWidget on StaffListPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(
              vertical: AppDimens.defaultPadding,
            ),
            child: Obx(
              () {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SDSBuildText(
                      LocaleKeys.staffList_listEmployy.tr,
                      style: AppTextStyle.font16Bo,
                    ),
                    sdsSBHeight8,
                    _buildListStaff(),
                    sdsSBHeight12,
                    SDSBuildText(
                      LocaleKeys.staffList_attachFile.tr,
                      style: AppTextStyle.font16Bo,
                    ),
                    sdsSBHeight8,
                    _buildSelectUploadFile(),
                    _buidHideImage(),
                  ],
                );
              },
            ),
          ),
        ),
        _buildAddNewStaffButton(),
        sdsSBHeight16,
        _buildSubmitButton(),
        sdsSBHeight32,
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buidHideImage() {
    return Obx(
      () {
        if (controller.listAttachImage.isEmpty) {
          return const SizedBox.shrink();
        }
        return Padding(
          padding: const EdgeInsets.only(top: AppDimens.paddingSmall),
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.basicWhite,
              borderRadius: BorderRadius.circular(AppDimens.radius10),
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
                        height: 60,
                        width: 60,
                        fit: BoxFit.cover,
                      ),
                      sdsSBWidth8,
                      Expanded(
                        child: SDSBuildText(
                          controller.getFileName(imageAttach.fileName),
                          maxLines: 2,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          controller.deteleImage(
                            controller.getFileNameFromUrl(imageAttach.imgPath),
                            index,
                          );
                        },
                        icon: SDSImageSvg(
                          Assets.ASSETS_ICONS_IC_REMOVE_SVG,
                          color: AppColors.colorBlack,
                          width: AppDimens.sizeIconMedium,
                          height: AppDimens.sizeIconMedium,
                        ),
                      ),
                    ],
                  ).paddingSymmetric(vertical: AppDimens.paddingSmall);
                },
              ),
            ).paddingSymmetric(horizontal: AppDimens.paddingSmall),
          ),
        );
      },
    );
  }

  Widget _buildSelectUploadFile() {
    return DottedBorder(
      color: AppColors.colorBorder,
      strokeWidth: 2,
      dashPattern: [4, 4],
      borderType: BorderType.RRect,
      radius: const Radius.circular(16),
      child: InkWell(
        onTap: _showBottomSheetUploadOptions,
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: AppColors.basicWhite,
            borderRadius: BorderRadius.circular(16),
          ),
          padding: const EdgeInsets.symmetric(vertical: AppDimens.padding24),
          child: Center(
            child: Column(
              children: [
                SDSImageSvg(Assets.ASSETS_ICONS_IC_UP_FILE_SVG),
                SDSBuildText(
                  'Tải ảnh lên',
                  style: AppTextStyle.font14Re
                      .copyWith(color: AppColors.primaryColor),
                ),
                SDSBuildText(
                  LocaleKeys.registerCode_contentDownloadAttachment.tr,
                  style: AppTextStyle.font14Re
                      .copyWith(color: AppColors.textColorGrey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showBottomSheetUploadOptions() {
    Get.bottomSheet(
      UtilWidget.buildBottomSheetFigma(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _buildUploadOption(
              icon: Icons.camera_alt_outlined,
              text: LocaleKeys.registerCode_imageFromCamera.tr,
              onTap: controller.takePhoto,
            ),
            const Divider(height: 1),
            _buildUploadOption(
              icon: Icons.image_outlined,
              text: LocaleKeys.registerCode_imageFromLibrary.tr,
              onTap: controller.pickImage,
            ),
            UtilWidget.sizedBox16,
          ],
        ),
      ),
    );
  }

  Widget _buildUploadOption({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return Material(
      color: Colors.white,
      child: InkWell(
        onTap: () {
          Get.back();
          onTap();
        },
        child: Row(
          children: [
            Icon(icon),
            UtilWidget.sizedBoxWidth8,
            Expanded(
              child: SDSBuildText(
                text,
                style: AppTextStyle.font16Semi,
              ),
            ),
          ],
        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
      ),
    );
  }

  Widget _buildListStaff() {
    final isListStaffEmpty = controller.declaredStaffs.isEmpty;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (isListStaffEmpty)
          SDSBuildText(
            LocaleKeys.staffList_noEmployeeDeclaredMessage.tr,
            style: AppTextStyle.font16Re,
          ).paddingAll(AppDimens.defaultPadding),
        ...addSeparator(
          spacer: sdsSBHeight12,
          children: controller.declaredStaffs.map(
            (staff) {
              return _buildStaffItem(staff);
            },
          ),
        ),
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
                if (staff.bhxhNumber.isNotEmpty)
                  SDSBuildText(
                    ' - ${staff.bhxhNumber}',
                    style: AppTextStyle.font16Bo,
                  ),
                const Spacer(),
                // SDSImageSvg(Assets.ASSETS_ICONS_IC_DELETE_SVG),
                _buildMenuPopupOnption(staff),
              ],
            ),
          ],
        ).paddingSymmetric(
          vertical: AppDimens.paddingSmall,
          horizontal: AppDimens.defaultPadding,
        ),
      ),
    );
  }

  Widget _buildMenuPopupOnption(DeclaredStaffModel staff) {
    return PopupMenuButton<ActionPopupStaffEnum>(
      surfaceTintColor: AppColors.basicWhite,
      constraints: const BoxConstraints(),
      color: AppColors.basicWhite,
      icon: const Icon(Icons.more_horiz),
      onSelected: (value) {
        if (value == ActionPopupStaffEnum.edit) {
          // Gọi hàm sửa
          controller.updateStaff(staff);
        } else if (value == ActionPopupStaffEnum.delete) {
          // Gọi hàm xóa
          controller.showDialogDeleteStaff(staff);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          value: ActionPopupStaffEnum.edit,
          child: Row(
            children: [
              SDSBuildText(LocaleKeys.staffList_edit.tr),
              sdsSBWidth16,
              const Icon(
                Icons.autorenew,
                color: AppColors.dsGray3,
              ),
            ],
          ),
        ),
        PopupMenuItem(
          value: ActionPopupStaffEnum.delete,
          child: Row(
            children: [
              SDSBuildText(LocaleKeys.staffList_delete.tr),
              sdsSBWidth16,
              SDSImageSvg(Assets.ASSETS_ICONS_IC_DELETE_SVG),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSubmitButton() {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
      height: AppDimens.btnLargeFigma,
      title: LocaleKeys.staffList_continue.tr,
      onPressed: controller.saveXml,
    );
  }

  Widget _buildAddNewStaffButton() {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.colorBlack),
      side: const BorderSide(width: 1, color: AppColors.colorBlack),
      backgroundColor: AppColors.basicWhite,
      height: AppDimens.btnLargeFigma,
      title: LocaleKeys.staffList_addNewStaff.tr,
      onPressed: () {
        EasyThrottle.throttle(
          'createStaff',
          const Duration(seconds: 1),
          () {
            controller.createStaff();
          },
        );
      },
    );
  }
}
