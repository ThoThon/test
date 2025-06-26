import 'package:v_bhxh/modules/src.dart';

import '../controller/controller.src.dart';

part 'forgot_password_widget.dart';

class ForgotPasswordPage extends BaseGetWidget {
  ForgotPasswordPage({super.key});

  @override
  ForgotPasswordController get controller => _controller;

  late final _controller = Get.put(ForgotPasswordController());

  @override
  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(body: _buildBody()),
    );
  }
}
