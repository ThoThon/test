import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../home/controller/home_controller.dart';

class ProfileScreen extends GetView<HomeController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            "Profile Screen",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 20),

          // Nút đăng xuất bình thường (giữ thông tin login)
          ElevatedButton(
            onPressed: _showLogoutDialog,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFf24e1e),
              foregroundColor: Colors.white,
              minimumSize: const Size(200, 50),
            ),
            child: const Text("Đăng xuất"),
          ),

          const SizedBox(height: 10),

          // Nút xóa hoàn toàn thông tin (nếu cần)
          TextButton(
            onPressed: _showCompleteLogoutDialog,
            child: const Text(
              "Xóa thông tin đăng nhập",
              style: TextStyle(color: Colors.grey),
            ),
          ),
        ],
      ),
    );
  }

  /// Dialog xác nhận đăng xuất (giữ thông tin login)
  void _showLogoutDialog() {
    Get.defaultDialog(
      title: "Đăng xuất",
      middleText:
          "Bạn có muốn đăng xuất?\n(Thông tin đăng nhập sẽ được giữ lại)",
      backgroundColor: Colors.white,
      titleStyle:
          const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      middleTextStyle: const TextStyle(color: Colors.black),
      radius: 15,
      textConfirm: "Đăng xuất",
      textCancel: "Hủy",
      confirmTextColor: Colors.white,
      cancelTextColor: const Color(0xFFf24e1e),
      buttonColor: const Color(0xFFf24e1e),
      onConfirm: () async {
        Get.back(); // Đóng dialog

        // Hiển thị loading
        Get.dialog(
          const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFf24e1e),
            ),
          ),
          barrierDismissible: false,
        );

        // Thực hiện logout
        await controller.logout();

        // Đóng loading và chuyển về login
        Get.back(); // Đóng loading
        Get.offAllNamed(Routes.login);

        // Thông báo thành công
        Get.snackbar(
          "Thành công",
          "Đã đăng xuất. Thông tin đăng nhập đã được giữ lại.",
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      },
    );
  }

  /// Dialog xác nhận xóa hoàn toàn thông tin
  void _showCompleteLogoutDialog() {
    Get.defaultDialog(
      title: "Xóa thông tin",
      middleText:
          "Bạn có chắc muốn xóa hoàn toàn thông tin đăng nhập?\n(Sẽ phải nhập lại từ đầu)",
      backgroundColor: Colors.white,
      titleStyle:
          const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      middleTextStyle: const TextStyle(color: Colors.black),
      radius: 15,
      textConfirm: "Xóa",
      textCancel: "Hủy",
      confirmTextColor: Colors.white,
      cancelTextColor: Colors.grey,
      buttonColor: Colors.red,
      onConfirm: () async {
        Get.back(); // Đóng dialog

        // Hiển thị loading
        Get.dialog(
          const Center(
            child: CircularProgressIndicator(color: Colors.red),
          ),
          barrierDismissible: false,
        );

        // Xóa hoàn toàn thông tin
        await controller.logoutCompletely();

        // Đóng loading và chuyển về login
        Get.back(); // Đóng loading
        Get.offAllNamed(Routes.login);

        // Thông báo
        Get.snackbar(
          "Đã xóa",
          "Thông tin đăng nhập đã được xóa hoàn toàn.",
          backgroundColor: Colors.orange,
          colorText: Colors.white,
          duration: const Duration(seconds: 2),
        );
      },
    );
  }
}
