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
                      const TextSpan(text: "Tổng đài CSKH:"),
                      TextSpan(
                        text: " 1800.8000 (nhánh 1)",
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
    return BuildInputTextWithLabel(
      label: LocaleKeys.login_username.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.usernameTextCtrl,
          obscureText: false,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys.login_usernameCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildInputPassword() {
    return BuildInputTextWithLabel(
      label: LocaleKeys.login_password.tr,
      buildInputText: BuildInputText(
        InputTextModel(
          controller: controller.passwordTextCtrl,
          obscureText: true,
          validator: (value) {
            if (value.isNullOrEmpty) {
              return LocaleKeys.login_passwordCannotEmpty.tr;
            }
            return null;
          },
        ),
      ),
    );
  }

  Widget _buildForgetPassword() {
    return InkWell(
      onTap: () {},
      child: SDSBuildText(
        'Quên mật khẩu?',
        style: AppTextStyle.font14Bo.copyWith(color: AppColors.primaryColor),
      ),
    );
  }
}
