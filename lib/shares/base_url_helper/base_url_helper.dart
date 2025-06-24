import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/controllers_base/app_controller/app_controller.dart';
import 'package:v_bhxh/core/router/app_route.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/core/values/hive_key.dart';

const String kTriggerChangeBaseUrl = "CHANGE_URL_VBHXH";

class BaseUrlHelper {
  // Make this a singleton
  static final BaseUrlHelper instance = BaseUrlHelper._();

  BaseUrlHelper._();

  String get currentUrl {
    return hiveApp.get(HiveKeys.keyBaseUrl) ?? AppApi.urlSign;
  }

  Future<void> setBaseUrl(String url) async {
    return hiveApp.put(HiveKeys.keyBaseUrl, url);
  }

  Future<void> switchEnv() async {
    final cbData = await Clipboard.getData(Clipboard.kTextPlain);
    if (cbData?.text == kTriggerChangeBaseUrl) {
      Get.toNamed(AppRoutes.changeBaseUrl.path);
    }
  }
}
