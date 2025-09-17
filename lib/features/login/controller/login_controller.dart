import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';

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
    final stored = AuthRepository.savedLoginInfo;
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

      final success = await AuthRepository.login(
        taxCode: tax,
        username: user,
        password: pass,
      );

      if (!success) {
        errorMessage.value = "Đăng nhập thất bại";
      }

      return success;
    } catch (e) {
      print('Lỗi login: $e');
      errorMessage.value = "Thông tin đăng nhập không hợp lệ";
      return false;
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> onLoginPressed() async {
    if (!(formKey.currentState?.validate() ?? false)) {
      return;
    }

    try {
      final success = await login();

      if (success) {
        Get.offAllNamed(Routes.home);
      } else {
        _showErrorDialog();
      }
    } catch (e) {
      print('Lỗi onLoginPressed: $e');
      _showErrorDialog();
    }
  }

  void _showErrorDialog() {
    Get.defaultDialog(
      title: "Lỗi",
      middleText: errorMessage.value.isNotEmpty
          ? errorMessage.value
          : "Có lỗi xảy ra khi đăng nhập",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black),
      middleTextStyle: const TextStyle(color: Colors.black),
      radius: 15,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFf24e1e),
          ),
          child: const Text("Đóng"),
        ),
      ],
    );
  }

  @override
  void onClose() {
    taxController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
