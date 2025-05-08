import 'package:flutter/material.dart';
import 'package:v_bhxh/base_app/controllers_base/app_controller/app_controller.dart';
import 'package:v_bhxh/shares/shares.src.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Get.findOrNull<AppController>()?.logout();
          },
          child: Text('Logout'),
        ),
      ),
    );
  }
}
