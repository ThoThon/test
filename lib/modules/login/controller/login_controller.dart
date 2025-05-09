import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/modules/login/repository/login_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

class LoginController extends BaseGetxController {
  late final _loginRepository = LoginRepository(this);
  final formKey = GlobalKey<FormState>();
  final usernameTextCtrl =
      TextEditingController(text: hiveApp.get(HiveKeys.keyUsername));
  final passwordTextCtrl =
      TextEditingController(text: hiveApp.get(HiveKeys.keyPassword));

  Future<void> login() async {
    if (formKey.currentState?.validate() != true) {
      return;
    }

    try {
      KeyBoard.hide();
      showLoadingOverlay();

      final username = usernameTextCtrl.text.trim();
      final password = passwordTextCtrl.text.trim();

      final response = await _loginRepository.login(
        username: username,
        password: password,
      );

      if (response.isSuccess) {
        await Future.wait([
          hiveApp.put(HiveKeys.keyUsername, username),
          hiveApp.put(HiveKeys.keyPassword, password),
          hiveApp.put(HiveKeys.keyJwtToken, response.result),
        ]);

        Get.offAndToNamed(AppRoutes.pageBuilder.path);
        return;
      } else {
        showSnackBar('Tên đăng nhập hoặc mật khẩu không hợp lệ');
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  @override
  void onClose() {
    usernameTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.onClose();
  }
}
