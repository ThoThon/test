import 'package:v_bhxh/shares/base_url_helper/base_url_helper.dart';

import '../../../base_app/controllers_base/app_controller/app_controller.dart';
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
      () {
        return Scaffold(
          // Thêm appbar để status bar của hệ thống hiển thị đúng màu sắc
          appBar: const BaseAppBar(title: UtilWidget.shrink),
          body: _buildBody(),
        );
      },
    );
  }
}
