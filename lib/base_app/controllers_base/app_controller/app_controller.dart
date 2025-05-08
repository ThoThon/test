import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:package_info_plus/package_info_plus.dart';
// ignore: depend_on_referenced_packages
import 'package:path_provider/path_provider.dart' as path_provider;

import '../../../shares/shares.src.dart';

late Box hiveApp;

late PackageInfo packageInfo;

String? tokenFCM;

class AppController extends GetxController {
  @override
  Future<void> onInit() async {
    // initHive().then((value) async {
    //   Get.put(BaseApiIcare(), permanent: true);
    // });
    super.onInit();
  }
}

Future<void> initHive() async {
  WidgetsFlutterBinding.ensureInitialized();
  final appDocumentDirectory =
      await path_provider.getApplicationDocumentsDirectory();
  Hive.init(appDocumentDirectory.path);
  hiveApp = await Hive.openBox(LocaleKeys.app_name.tr);
  packageInfo = await PackageInfo.fromPlatform();
}
