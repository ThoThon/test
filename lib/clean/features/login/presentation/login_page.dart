import 'package:flutter/material.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/features/login/presentation/controller/login_controller.dart';

class LoginPage extends BaseGetPage<LoginController> {
  LoginPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: controller.login,
          child: const Text('Login'),
        ),
      ),
    );
  }
}
