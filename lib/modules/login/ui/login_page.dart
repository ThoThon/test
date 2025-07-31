import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive_impl.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper.dart';

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
