part of 'login_page.dart';

extension LoginWidget on LoginPage {
  Widget _buildBody() {
    return SafeArea(
      child: Form(
        key: controller.formKey,
        child: Obx(
          () {
            return Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onDoubleTap: EnvSwitcher.instance.switchEnv,
                          child: _buildLogo(),
                        ),
                        const SizedBox(height: AppDimens.padding40),
                        controller.isHaveUsername.value
                            ? _buildCompanyName()
                            : _buildInputAccount(),
                        UtilWidget.sizedBox16,
                        _buildInputPassword(),
                        sdsSBHeight8,
                        Row(
                          children: [
                            // _buildForgetPassword(),
                            const Spacer(),
                            controller.isHaveUsername.value
                                ? _buildChangeAccount()
                                : const SizedBox.shrink()
                          ],
                        ),
                        sdsSBHeight8,
                        _buildButtonLogin(),
                        sdsSBHeight8,
                        _buildRegisterForCode(),
                      ],
                    ),
                  ),
                ),
                _buildPhoneService(),
              ],
            );
          },
        ),
      ).paddingAll(AppDimens.defaultPadding),
    );
  }

  Widget _buildLogo() {
    return Center(
      child: SDSImageSvg(
        Assets.ASSETS_IMAGES_LOGO_VIETTEL_SVG,
        width: Get.width / 2,
      ),
    ).paddingOnly(top: AppDimens.padding25);
  }

  Widget _buildInputAccount() {
    return BuildInputText(
      InputTextModel(
        hintText: LocaleKeys.login_inputAccount.tr,
        controller: controller.usernameTextCtrl,
        obscureText: false,
        inputFormatters: InputFormatterEnum.password,
        isShowCounterText: false,
        maxLengthInputForm: 25,
        validator: (value) {
          if (value.isNullOrEmpty) {
            return LocaleKeys.login_userNameCannotEmpty.tr;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildInputPassword() {
    return BuildInputText(
      InputTextModel(
        hintText: LocaleKeys.login_inputPassword.tr,
        controller: controller.passwordTextCtrl,
        isShowCounterText: false,
        inputFormatters: InputFormatterEnum.password,
        maxLengthInputForm: 50,
        obscureText: true,
        validator: (value) {
          if (value.isNullOrEmpty) {
            return LocaleKeys.login_passwordCannotEmpty.tr;
          }
          return null;
        },
      ),
    );
  }

  // Widget _buildForgetPassword() {
  //   return InkWell(
  //     onTap: () {
  //       Get.toNamed(AppRoutes.forgotLogin.path);
  //     },
  //     child: SDSBuildText(
  //       LocaleKeys.login_forgetPassword.tr,
  //       style: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
  //     ),
  //   );
  // }

  Widget _buildChangeAccount() {
    return InkWell(
      onTap: () {
        controller.isHaveUsername.value = false;
        controller.usernameTextCtrl.clear();
      },
      child: SDSBuildText(
        LocaleKeys.login_changeAccount.tr,
        style: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
      ),
    );
  }

  Widget _buildCompanyName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(LocaleKeys.login_hello.tr),
        SDSBuildText(
          "${hiveApp.get(HiveKeys.keyCompanyName) ?? ''}",
          style: AppTextStyle.font16Bo,
        ),
      ],
    );
  }

  Widget _buildButtonLogin() {
    return UtilWidget.buildSolidButton(
      title: LocaleKeys.login_login.tr,
      height: AppDimens.btnLargeFigma,
      onPressed: () {
        controller.login();
      },
    );
  }

  Widget _buildPhoneService() {
    return RichText(
      text: TextSpan(
        style: AppTextStyle.font18Bo,
        children: [
          TextSpan(text: LocaleKeys.login_serviceCenter.tr),
          TextSpan(
            text: " ${LocaleKeys.login_phoneNumber.tr}",
            style: AppTextStyle.font18Bo.copyWith(
              color: AppColors.primaryColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRegisterForCode() {
    return Center(
      child: InkWell(
        onTap: controller.goToRegisterCodePage,
        child: SDSBuildText(
          LocaleKeys.login_registerForCode.tr,
          style: AppTextStyle.font14Re.copyWith(
            color: AppColors.primaryColor,
            fontStyle: FontStyle.italic,
            decoration: TextDecoration.underline,
            decorationColor: AppColors.primaryColor,
          ),
        ),
      ),
    );
  }
}
