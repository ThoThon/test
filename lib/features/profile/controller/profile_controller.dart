import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';
import '../../cart/models/cart_storage.dart';

class ProfileController extends GetxController {
  final RxString userName = ''.obs;
  final RxString userTaxCode = ''.obs;
  final RxBool isLoggingOut = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  void loadUserInfo() {
    final loginInfo = AuthRepository.savedLoginInfo;
    if (loginInfo != null) {
      userName.value = loginInfo.username;
      userTaxCode.value = loginInfo.taxCode;
    }
  }

  Future<void> logout() async {
    try {
      // Dialog xác nhận đăng xuất
      final confirmed = await _showLogoutConfirmDialog();
      if (!confirmed) return;

      isLoggingOut.value = true;

      // Xóa thông tin đăng nhập
      await AuthRepository.logoutKeepForm();

      // Xóa tất cả thông tin giỏ hàng
      await CartStorage.clearCart();

      // Chuyển về màn login và xóa tất cả routes trước đó
      Get.offAllNamed(Routes.login);
    } catch (e) {
      print('Lỗi logout: $e');
      Get.snackbar(
        "Lỗi",
        "Có lỗi xảy ra khi đăng xuất",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
      );
    } finally {
      isLoggingOut.value = false;
    }
  }

  Future<bool> _showLogoutConfirmDialog() async {
    final result = await Get.defaultDialog<bool>(
      title: "Xác nhận đăng xuất",
      middleText:
          "Bạn có chắc chắn muốn đăng xuất?\nTất cả thông tin giỏ hàng sẽ bị xóa.",
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
      middleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 16,
      ),
      radius: 15,
      actions: [
        TextButton(
          onPressed: () => Get.back(result: false),
          child: const Text(
            "Hủy",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 8),
        ElevatedButton(
          onPressed: () => Get.back(result: true),
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFFf24e1e),
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: const Text(
            "Đăng xuất",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );

    return result ?? false;
  }
}
