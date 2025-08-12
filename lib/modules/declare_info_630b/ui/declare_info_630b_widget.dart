part of 'declare_info_630b_page.dart';

extension DeclareInfo630bWidget on DeclareInfo630bPage {
  Widget _buildBody() {
    return Column(
      children: [
        Expanded(
          child: AppFormRegistry(
            key: controller.registeredKey,
            child: Form(
              key: controller.formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildGroupPersonInfo(),
                    _buildDeclareInfoGroup(),
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
