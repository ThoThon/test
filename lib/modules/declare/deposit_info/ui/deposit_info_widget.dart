part of 'deposit_info_page.dart';

extension DepositInfoWidget on DepositInfoPage {
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
            Get.bottomSheet(
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
                        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
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
                        ).paddingSymmetric(vertical: AppDimens.defaultPadding),
                      ),
                    ),
                    UtilWidget.sizedBox16,
                  ],
                ),
              ),
            );
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
        UtilWidget.sizedBox8,
        if (controller.imagePath.value != null)
          Stack(
            children: [
              Image.file(
                File(controller.imagePath.value!),
                width: double.infinity,
              ),
              Positioned(
                right: 0,
                top: 0,
                child: IconButton(
                  color: AppColors.primaryColor,
                  style: IconButton.styleFrom(backgroundColor: Colors.white),
                  onPressed: controller.removeImage,
                  icon: const Icon(Icons.close),
                ),
              ),
            ],
          ),
        UtilWidget.sizedBox8,
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
                      result: const DepositInfoResult(
                        action: DepositInfoResultAction.selectD02Tab,
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
                    '${staff.name} (${staff.phoneNumber})',
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
            result: const DepositInfoResult(
              action: DepositInfoResultAction.selectD02Tab,
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
