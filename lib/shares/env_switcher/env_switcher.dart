import 'package:flutter/services.dart';
import 'package:v_bhxh/core/values/app_api.dart';

const String kTriggerSWITCH_ENV = "SWITCH_ENV_VBHXH";

class EnvSwitcher {
  // Make this a singleton
  static final EnvSwitcher instance = EnvSwitcher._();

  EnvSwitcher._();

  var useSignUrl = true;

  String get currentUrl {
    return useSignUrl ? AppApi.urlSign : AppApi.url;
  }

  Future<void> switchEnv() async {
    final cbData = await Clipboard.getData(Clipboard.kTextPlain);
    if (cbData?.text == kTriggerSWITCH_ENV) {
      useSignUrl = !useSignUrl;
    }
  }
}
