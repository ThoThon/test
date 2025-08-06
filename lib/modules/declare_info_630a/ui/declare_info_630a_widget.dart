part of 'declare_info_630a_page.dart';

extension DeclareInfo630aWidget on DeclareInfo630aPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: AppFormRegistry(
            key: controller.registeredKey,
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                controller: controller.scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Thông tin cá nhân
                    _buildGroupPersonInfo(),

                    // Thông tin kê khai
                    _buildDeclareInfoGroup(),

                    // "Thông tin tài khoản nhận trợ cấp" và "Thông tin khác"
                    _buildBenefitAccountInfoGroup(),
                  ],
                ),
              ),
            ),
          ),
        ),
        _buildSaveButton(),
      ],
    ).paddingSymmetric(horizontal: AppDimens.defaultPadding);
  }

  Widget _buildSaveButton() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
        return UtilWidget.buildSolidButton(
          title: LocaleKeys.declareInfo_saveButton.tr,
          backgroundColor: AppColors.primaryColor,
          borderRadius: AppDimens.radius30,
          onPressed: controller.saveDraft,
        ).paddingOnly(top: AppDimens.paddingSmall);
      },
    );
  }
}
