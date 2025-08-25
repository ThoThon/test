import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/login/login_info.dart';
import '../models/login/login_storage.dart';

class LoginController extends GetxController {
  final formKey = GlobalKey<FormState>();

  final TextEditingController taxController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLogin();
  }

  void loadSavedLogin() {
    final stored = LoginStorage.getLoginInfo();
    if (stored != null) {
      taxController.text = stored.taxCode;
      usernameController.text = stored.username;
      passwordController.text = stored.password;
    }
  }

  Future<bool> login() async {
    isLoading.value = true;
    errorMessage.value = '';

    await Future.delayed(const Duration(seconds: 1));

    final tax = taxController.text.trim();
    final user = usernameController.text.trim();
    final pass = passwordController.text.trim();

    if (tax == "1111111111" && user == "demo" && pass == "123456") {
      final info = LoginInfo(
        username: user,
        password: pass,
        taxCode: tax,
      );
      await LoginStorage.saveLoginInfo(info);
      isLoading.value = false;
      return true;
    }

    errorMessage.value = "Thông tin đăng nhập không hợp lệ";
    isLoading.value = false;
    return false;
  }

  @override
  void onClose() {
    taxController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
