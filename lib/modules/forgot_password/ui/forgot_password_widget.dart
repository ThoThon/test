part of 'forgot_password_page.dart';

extension ForgotPasswordWidget on ForgotPasswordPage {
  Widget _buildBody() {
    return SDSSafearea(
      child: Form(
        key: controller.formKey,
        child: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  _buildLogo(),
                  const SizedBox(height: AppDimens.padding40),
                  _buildInputTaxCode(),
                  UtilWidget.sizedBox16,
                  _buildInputUnitCode(),
                  sdsSBHeight16,
                  UtilWidget.buildSolidButton(
                    title: LocaleKeys.login_resetPassword.tr,
                    height: AppDimens.btnLargeFigma,
                    textStyle: AppTextStyle.font16Re
                        .copyWith(color: AppColors.basicWhite),
                    borderRadius: AppDimens.radius30,
                    onPressed: () {
                      controller.forgotPassword();
                    },
                  ),
                  sdsSBHeight8,
                  _buildBackToLogin(),
                ],
              )),
            ),
            _buildPhoneService(),
          ],
        ).paddingAll(AppDimens.defaultPadding),
      ),
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

  Widget _buildInputUnitCode() {
    return BuildInputText(
      InputTextModel(
        maxLengthInputForm: 7,
        inputFormatters: InputFormatterEnum.textOnly,
        hintText: LocaleKeys.login_inputUnitCode.tr,
        controller: controller.unitCodeController,
        borderRadius: AppDimens.radius8,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        obscureText: false,
        validator: (value) {
          if (value.isNullOrEmpty) {
            return LocaleKeys.login_unitCodeCannotEmpty.tr;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildInputTaxCode() {
    return BuildInputText(
      InputTextModel(
        maxLengthInputForm: 20,
        inputFormatters: InputFormatterEnum.textNormal,
        hintText: LocaleKeys.login_inputTaxCode.tr,
        controller: controller.taxCodeController,
        borderRadius: AppDimens.radius8,
        obscureText: false,
        border: InputBorder.none,
        errorBorder: InputBorder.none,
        focusedBorder: InputBorder.none,
        enabledBorder: InputBorder.none,
        disabledBorder: InputBorder.none,
        focusedErrorBorder: InputBorder.none,
        validator: (value) {
          if (value.isNullOrEmpty) {
            return LocaleKeys.login_taxCodeCannotEmpty.tr;
          }
          return null;
        },
      ),
    );
  }

  Widget _buildBackToLogin() {
    return Center(
      child: InkWell(
        onTap: () {
          Get.back();
        },
        child: SDSBuildText(
          LocaleKeys.login_backToLogin.tr,
          style: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
        ),
      ),
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
}
