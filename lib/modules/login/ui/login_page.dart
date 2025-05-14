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
          child: SingleChildScrollView(
            padding: EdgeInsets.all(AppDimens.defaultPadding),
            child: Form(
              key: controller.formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SizedBox(height: AppDimens.padding80),
                  BuildInputTextWithLabel(
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
                  ),
                  UtilWidget.sizedBox16,
                  BuildInputTextWithLabel(
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
                  ),
                  UtilWidget.sizedBox16,
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
        ),
      ),
    );
  }
}
