import 'dart:async';

import 'package:flutter/services.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';

import '../../../modules/src.dart';

late AppHive hiveApp;

class AppController extends BaseGetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    _initHive().then((value) async {
      SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

      // Đảm bảo status bar và navigation bar trong suốt
      SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
        systemNavigationBarColor:
            Colors.transparent, // Thanh điều hướng trong suốt
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent, // Thanh trạng thái trong suốt
        statusBarIconBrightness: Brightness.dark, // Icon màu đen
      ));
      await Get.offAndToNamed(AppRoutes.login.path);
    });
  }

  Future<void> _initHive() async {
    hiveApp = AppHive();
    await hiveApp.init();
  }

  Future<void> logout() async {
    await hiveApp.deleteKeys([
      HiveKeys.keyJwtToken,
      HiveKeys.keyUsername,
    ]);
    Get.offAllNamed(AppRoutes.login.path);
  }
}
