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
  late final _loginRepository = LoginRepository(this);

  AccountInfoModel? accountInfoModel;

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

      MockSdk().isMock = true;
      MockSdk().mockEmail = "mobile_test_1";

      await _checkLogin();
    });
  }

  Future<void> _initHive() async {
    final appDocumentDirectory =
        await path_provider.getApplicationDocumentsDirectory();
    Hive.init(appDocumentDirectory.path);
    hiveApp = await Hive.openBox('vBHXH');
    packageInfo = await PackageInfo.fromPlatform();
  }

  Future<void> getAccountInfo() async {
    try {
      final res = await _loginRepository.getAccountInfo();
      if (res.code == AppConst.statusCodeSuccess && res.result != null) {
        accountInfoModel = res.result;
      }
    } catch (e) {
      logger.d(e);
    }
  }

  Future<void> _checkLogin() async {
    try {
      final username = hiveApp.get(HiveKeys.keyUsername);
      final password = hiveApp.get(HiveKeys.keyPassword);
      final jwtToken = hiveApp.get(HiveKeys.keyJwtToken);

      if (username == null || password == null || jwtToken == null) {
        Get.offAndToNamed(AppRoutes.login.path);
        return;
      }

      final response = await _loginRepository.login(
        username: username,
        password: password,
      );

      if (response.isSuccess) {
        await Future.wait([
          hiveApp.put(HiveKeys.keyUsername, username),
          hiveApp.put(HiveKeys.keyPassword, password),
          hiveApp.put(HiveKeys.keyJwtToken, response.result),
        ]);

        Get.offAndToNamed(AppRoutes.pageBuilder.path);
        return;
      }

      Get.offAndToNamed(AppRoutes.login.path);
    } catch (e) {
      logger.e(e);
      Get.offAndToNamed(AppRoutes.login.path);
    }
  }

  Future<void> logout() async {
    await hiveApp.deleteAll([
      HiveKeys.keyJwtToken,
    ]);
    Get.offAllNamed(AppRoutes.login.path);
  }
}
