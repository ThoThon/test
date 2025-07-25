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
                          onDoubleTap: BaseUrlHelper.instance.switchEnv,
                          child: _buildLogo(),
                        ),
                        const SizedBox(height: AppDimens.padding24),
                        controller.isHaveUsername.value
                            ? _buildCompanyName()
                            : _buildInputAccount(),
                        sdsSBHeight12,
                        _buildInputPassword(),
                        sdsSBHeight12,
                        Row(
                          children: [
                            controller.isHaveUsername.value
                                ? _buildChangeAccount()
                                : const SizedBox.shrink(),
                            const Spacer(),
                            _buildForgetPassword(),
                          ],
                        ),
                        _buildButtonLogin(),
                        sdsSBHeight12,
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
    ).paddingOnly(top: AppDimens.paddingSmall);
  }

  Widget _buildInputAccount() {
    return CardInputTextForm(
      controller: controller.usernameTextCtrl,
      hintText: LocaleKeys.login_inputAccount.tr,
      inputFormatters: InputFormatterEnum.password,
      maxLengthInputForm: 25,
      isShowCounterText: false,
      borderRadius: AppDimens.radius6,
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.login_userNameCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildInputPassword() {
    return CardInputTextForm(
      hintText: LocaleKeys.login_inputPassword.tr,
      controller: controller.passwordTextCtrl,
      isShowCounterText: false,
      inputFormatters: InputFormatterEnum.password,
      maxLengthInputForm: 50,
      obscureText: true,
      borderRadius: AppDimens.radius6,
      validator: (value) {
        final trimmedValue = value?.trim() ?? '';
        if (trimmedValue.isEmpty) {
          return LocaleKeys.login_passwordCannotEmpty.tr;
        }
        return null;
      },
    );
  }

  Widget _buildForgetPassword() {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: AppDimens.paddingSmall,
        left: AppDimens.defaultPadding,
      ),
      child: InkWell(
        onTap: () {
          Get.toNamed(AppRoutesCl.forgotLogin.path);
        },
        child: SDSBuildText(
          LocaleKeys.login_forgetPassword.tr,
          style: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }

  Widget _buildChangeAccount() {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDimens.paddingSmall),
      child: InkWell(
        onTap: () {
          controller.isHaveUsername.value = false;
          controller.usernameTextCtrl.clear();
        },
        child: SDSBuildText(
          LocaleKeys.login_changeAccount.tr,
          style: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
        ),
      ),
    );
  }

  Widget _buildCompanyName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SDSBuildText(LocaleKeys.login_hello.tr),
        sdsSBHeight8,
        SDSBuildText(
          "${appHive.get(HiveKeys.keyCompanyName) ?? ''}",
          style: AppTextStyle.font16Bo,
        ),
      ],
    );
  }

  Widget _buildButtonLogin() {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.basicWhite),
      title: LocaleKeys.login_login.tr,
      height: AppDimens.btnLargeFigma,
      onPressed: () {
        controller.login();
      },
    );
  }

  Widget _buildPhoneService() {
    return KeyboardVisibilityBuilder(
      builder: (p0, isKeyboardVisible) {
        if (isKeyboardVisible) {
          return const SizedBox.shrink();
        }
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
      },
    );
  }

  Widget _buildRegisterForCode() {
    return UtilWidget.buildSolidButton(
      borderRadius: AppDimens.radius30,
      title: LocaleKeys.login_register.tr,
      backgroundColor: AppColors.basicWhite,
      textStyle: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
      side: const BorderSide(width: 1, color: AppColors.primaryColor),
      onPressed: () {
        // controller.goToRegisterCodePage();
      },
    );
  }
}
