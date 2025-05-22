import 'dart:async';

import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/login/repository/login_repository.dart';

import '../../../modules/src.dart';

late Box hiveApp;

late PackageInfo packageInfo;

class AppController extends BaseGetxController {
  AccountInfoModel? accountInfoModel;
  D02Categories? d02Categories;

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
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    hiveApp = await Hive.openBox('vBHXH');
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> logout() async {
    await hiveApp.deleteAll([
      HiveKeys.keyJwtToken,
      HiveKeys.keyUsername,
    ]);
    Get.offAllNamed(AppRoutes.login.path);
  }
}
