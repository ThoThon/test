import '../../../modules/src.dart';

part 'login_widget.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  LoginPage({super.key});

  @override
  LoginController get controller => _controller;

  late final _controller = Get.put(LoginController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        body: SafeArea(
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
                        _buildLogo(MediaQuery.of(context).size.width / 2),
                        const SizedBox(height: AppDimens.padding40),
                        _buildInputAccount(),
                        UtilWidget.sizedBox16,
                        _buildInputPassword(),
                        sdsSBHeight8,
                        _buildForgetPassword(),
                        sdsSBHeight8,
                        UtilWidget.buildSolidButton(
                          title: LocaleKeys.login_login.tr,
                          height: AppDimens.btnLargeFigma,
                          onPressed: () {
                            controller.login();
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                RichText(
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
                ),
              ],
            ),
          ).paddingAll(AppDimens.defaultPadding),
        ),
      ),
    );
  }

  Widget _buildLogo(double? width) {
    return Center(
      child: SDSImageSvg(
        Assets.ASSETS_IMAGES_LOGO_VIETTEL_SVG,
        width: width,
      ),
    ).paddingOnly(top: AppDimens.padding25);
  }

  Widget _buildInputAccount() {
    return BuildInputText(
      InputTextModel(
        hintText: LocaleKeys.login_inputUnitCode.tr,
        controller: controller.usernameTextCtrl,
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

  Widget _buildInputPassword() {
    return BuildInputText(
      InputTextModel(
        hintText: LocaleKeys.login_inputPassword.tr,
        controller: controller.passwordTextCtrl,
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

  Widget _buildForgetPassword() {
    return InkWell(
      onTap: () {},
      child: SDSBuildText(
        LocaleKeys.login_forgetPassword.tr,
        style: AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
