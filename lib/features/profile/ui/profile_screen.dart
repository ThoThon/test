import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const SizedBox(height: 40),
            _buildProfileHeader(),
            const SizedBox(height: 40),
            _buildUserInfo(),
            const SizedBox(height: 300),
            _buildLogoutButton(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Column(
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(
              color: const Color(0xFFf24e1e),
              width: 3,
            ),
          ),
          child: const CircleAvatar(
            radius: 50,
            backgroundColor: Color(0xFFF5F5F5),
            child: Icon(
              Icons.person,
              size: 50,
              color: Color(0xFFf24e1e),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Obx(
          () => Text(
            controller.userName.value.isNotEmpty
                ? controller.userName.value
                : "Người dùng",
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildUserInfo() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thông tin tài khoản",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFFf24e1e),
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow("Tài khoản:", controller.userName),
          const SizedBox(height: 12),
          _buildInfoRow("Mã số thuế:", controller.userTaxCode),
        ],
      ),
    );
  }

  Widget _buildInfoRow(String label, RxString value) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 110,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Obx(
            () => Text(
              value.value.isNotEmpty ? value.value : "-",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildLogoutButton() {
    return SizedBox(
      width: double.infinity,
      height: 56,
      child: Obx(() => ElevatedButton.icon(
            onPressed: controller.isLoggingOut.value ? null : controller.logout,
            icon: controller.isLoggingOut.value
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      color: Colors.white,
                      strokeWidth: 2,
                    ),
                  )
                : const Icon(
                    Icons.logout,
                    color: Colors.white,
                    size: 20,
                  ),
            label: Text(
              controller.isLoggingOut.value ? "Đang đăng xuất..." : "Đăng xuất",
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFf24e1e),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              elevation: 2,
            ),
          )),
    );
  }
}
