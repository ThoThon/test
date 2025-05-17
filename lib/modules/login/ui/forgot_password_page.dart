import 'package:v_bhxh/modules/src.dart';

class ForgotPasswordPage extends BaseGetWidget {
  ForgotPasswordPage({super.key});

  @override
  ForgotPasswordController get controller => _controller;

  late final _controller = Get.put(ForgotPasswordController());

  @override
  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      body: SDSSafearea(
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
                  _buildInputUnit(),
                  sdsSBHeight8,
                  _buildBackToLogin(),
                  sdsSBHeight8,
                  UtilWidget.buildSolidButton(
                    title: LocaleKeys.login_resetPassword.tr,
                    height: AppDimens.btnLargeFigma,
                    onPressed: () {},
                  ),
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

  Widget _buildInputUnit() {
    return BuildInputText(
      InputTextModel(
        hintText: LocaleKeys.login_inputUnitCode.tr,
        controller: controller.unitCodeController,
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
        hintText: LocaleKeys.login_inputTaxCode.tr,
        controller: controller.taxCodeController,
        obscureText: false,
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
    return InkWell(
      onTap: () {
        Get.back();
      },
      child: SDSBuildText(
        LocaleKeys.login_backToLogin.tr,
        style: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
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
