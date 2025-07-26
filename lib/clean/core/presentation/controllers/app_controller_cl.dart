import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/domain/entity/account_info.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';

class AppControllerCl extends BaseGetClController {
  final accountInfo = Rxn<AccountInfo>();

  @override
  void onInit() {
    super.onInit();
    _configSystemUI();
  }

  void _configSystemUI() {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    // Đảm bảo status bar và navigation bar trong suốt
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        systemNavigationBarColor:
            Colors.transparent, // Thanh điều hướng trong suốt
        systemNavigationBarContrastEnforced: false,
        statusBarColor: Colors.transparent, // Thanh trạng thái trong suốt
        statusBarIconBrightness: Brightness.dark, // Icon màu đen
      ),
    );
  }
}
