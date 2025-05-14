part of 'declaration_period_detail_page.dart';

extension DeclarationPeriodDetailPageWidget on DeclarationPeriodDetailPage {
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
        _buildSubmitButton()
            .paddingSymmetric(horizontal: AppDimens.defaultPadding),
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
            controller.pickImage();
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
                onTap: () {},
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
      onTap: () {},
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
      title: LocaleKeys.declarationPeriodDetail_deposit.tr,
      onPressed: () {
        Get.toNamed(AppRoutes.declareInfo.path);
      },
    );
  }
}
