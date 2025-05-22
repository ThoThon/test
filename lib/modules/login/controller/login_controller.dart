import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/modules/login/repository/login_repository.dart';
import 'package:v_bhxh/shares/function/logger.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

class LoginController extends BaseGetxController {
  late final _loginRepository = LoginRepository(this);
  final formKey = GlobalKey<FormState>();
  // Username test : sd8888k17
  // Password test : Viettel@789
  final usernameTextCtrl = TextEditingController();
  final passwordTextCtrl = TextEditingController(text: 'Viettel@789');
  final isHaveUsername = false.obs;
  final appController = Get.find<AppController>();

  @override
  void onInit() {
    super.onInit();
    if (hiveApp.get(HiveKeys.keyUsername) != null) {
      usernameTextCtrl.text = hiveApp.get(HiveKeys.keyUsername);
    }
    isHaveUsername.value = hiveApp.get(HiveKeys.keyUsername) != null;
  }

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
          hiveApp.put(HiveKeys.keyJwtToken, response.result),
        ]);
        await (
          _getAccountInfo(),
          _getD02Categories(),
        ).wait;
        Get.offAndToNamed(AppRoutes.pageBuilder.path);
        return;
      } else {
        showSnackBar(LocaleKeys.login_usernameAndPasswordInValid.tr);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> _getAccountInfo() async {
    try {
      final res = await _loginRepository.getAccountInfo();
      if (res.code == AppConst.statusCodeSuccess && res.result != null) {
        appController.accountInfoModel = res.result;
        //Lưu tên tổ chức lại để hiện ngoài màn login
        if (res.result != null) {
          hiveApp.put(HiveKeys.keyCompanyName, res.result?.tenToChuc);
        }
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _getD02Categories() async {
    try {
      final res = await _loginRepository.getD02Categories();
      if (res.code == AppConst.statusCodeSuccess && res.result != null) {
        appController.d02Categories = res.result;
      }
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  void onClose() {
    usernameTextCtrl.dispose();
    passwordTextCtrl.dispose();
    super.onClose();
  }
}
