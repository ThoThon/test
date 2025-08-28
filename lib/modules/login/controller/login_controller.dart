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
  final RxBool hasRestoredLogin = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadSavedLogin();
  }

  /// Load thông tin đăng nhập đã lưu (nếu có)
  void loadSavedLogin() {
    final stored = LoginStorage.getLoginInfo();
    if (stored != null) {
      taxController.text = stored.taxCode;
      usernameController.text = stored.username;
      passwordController.text = stored.password;
      hasRestoredLogin.value = true;

      // Hiển thị thông báo nếu có thông tin đã lưu
      if (LoginStorage.hasSavedLoginInfo) {
        Future.delayed(const Duration(milliseconds: 500), () {
          Get.snackbar(
            "Thông tin đã khôi phục",
            "Thông tin đăng nhập trước đó đã được tự động điền.",
            backgroundColor: Colors.blue,
            colorText: Colors.white,
            duration: const Duration(seconds: 2),
          );
        });
      }
    }
  }

  /// Thực hiện đăng nhập
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
        errorMessage.value = response['message'] ?? "Đăng nhập thất bại";
      }
    } catch (e) {
      print('Lỗi login: $e');
      if (e.toString().contains('SocketException') ||
          e.toString().contains('TimeoutException')) {
        errorMessage.value =
            "Không thể kết nối đến server. Vui lòng kiểm tra internet.";
      } else {
        errorMessage.value = "Thông tin đăng nhập không hợp lệ";
      }
    }

    isLoading.value = false;
    return false;
  }

  /// Xóa thông tin đã điền
  void clearFields() {
    Get.defaultDialog(
      title: "Xác nhận",
      middleText: "Bạn có muốn xóa thông tin đã điền?",
      textConfirm: "Xóa",
      textCancel: "Hủy",
      confirmTextColor: Colors.white,
      buttonColor: Colors.red,
      onConfirm: () {
        taxController.clear();
        usernameController.clear();
        passwordController.clear();
        hasRestoredLogin.value = false;
        Get.back();

        Get.snackbar(
          "Đã xóa",
          "Thông tin đã được xóa khỏi form.",
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          duration: const Duration(seconds: 1),
        );
      },
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
