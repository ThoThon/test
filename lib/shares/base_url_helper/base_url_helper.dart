import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive_impl.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/core/values/hive_key.dart';

const String kTriggerChangeBaseUrl = "CHANGE_URL_VBHXH";

class BaseUrlHelper {
  // Make this a singleton
  static final BaseUrlHelper instance = BaseUrlHelper._();

  BaseUrlHelper._();

  String get currentUrl {
    return AppHiveImpl.instance.get(HiveKeys.keyBaseUrl) ?? AppApi.urlSign;
  }

  Future<void> setBaseUrl(String url) async {
    return AppHiveImpl.instance.put(HiveKeys.keyBaseUrl, url);
  }

  Future<void> switchEnv() async {
    final cbData = await Clipboard.getData(Clipboard.kTextPlain);
    if (cbData?.text == kTriggerChangeBaseUrl) {
      Get.toNamed(AppRoutesCl.changeBaseUrl.path);
    }
  }
}
