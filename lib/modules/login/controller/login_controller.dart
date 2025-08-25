import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/remote/api_service.dart';
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

    try {
      final tax = taxController.text.trim();
      final user = usernameController.text.trim();
      final pass = passwordController.text.trim();

      final response =
          await ApiService.login(taxCode: tax, username: user, password: pass);

      if (response['success'] == true) {
        String token = response['data']['token'];

        final info = LoginInfo(
          username: user,
          password: pass,
          taxCode: tax,
          token: token,
        );
        await LoginStorage.saveLoginInfo(info);
        isLoading.value = false;
        return true;
      } else {
        errorMessage.value = "Đăng nhập thất bại";
      }
    } catch (e) {
      print('Lỗi login : $e');
      errorMessage.value = "Thông tin đăng nhập không hợp lệ";
    }
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
