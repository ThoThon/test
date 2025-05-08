import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';
import 'package:v_bhxh/modules/login/login_src.dart';

part 'login_widget.dart';

class LoginPage extends BaseGetWidget<LoginController> {
  LoginPage({super.key});

  @override
  LoginController get controller => _controller;

  late final _controller = Get.put(LoginController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            controller.login();
          },
          child: Text("Login"),
        ),
      ),
    );
  }
}
