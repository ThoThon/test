import 'package:app_crud_getx/services/remote/api_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../models/login_info.dart';
import '../models/login_storage.dart';

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

      final response = await ApiService.login(
        taxCode: tax,
        username: user,
        password: pass,
      );

      if (response.success && response.data != null) {
        String token = response.data!.token;

        final info = LoginInfo(
          username: user,
          password: pass,
          taxCode: tax,
          token: token,
        );
        await LoginStorage.saveLoginInfo(info);

        return true;
      } else {
        errorMessage.value = "Đăng nhập thất bại";
      }
    } catch (e) {
      print('Lỗi login : $e');
      errorMessage.value = "Thông tin đăng nhập không hợp lệ";
    } finally {
      isLoading.value = false;
    }

    return false;
  }

  Future<void> onLoginPressed() async {
    if (formKey.currentState?.validate() ?? false) {
      final success = await login();

      if (success) {
        Get.offAllNamed(Routes.home);
      } else {
        Get.defaultDialog(
          title: "Lỗi",
          middleText: errorMessage.value,
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
    }
  }

  @override
  void onClose() {
    taxController.dispose();
    usernameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
