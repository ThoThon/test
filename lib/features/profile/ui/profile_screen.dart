import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/profile_controller.dart';

class ProfileScreen extends GetView<ProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          const SizedBox(height: 40),
          _buildProfileHeader(),
          const SizedBox(height: 40),
          _buildUserInfo(),
          const Spacer(),
          _buildLogoutButton(),
          const SizedBox(height: 20),
        ],
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
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Thông tin tài khoản",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
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
          width: 100,
          child: Text(
            label,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
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
                fontWeight: FontWeight.w500,
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
      height: 50,
      child: ElevatedButton(
        onPressed: controller.logout,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFf24e1e),
          foregroundColor: Colors.white,
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
    );
  }
}
