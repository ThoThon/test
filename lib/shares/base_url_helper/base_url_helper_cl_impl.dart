import 'package:flutter/services.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/core/values/hive_key.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl.dart';

const String _kTriggerChangeBaseUrl = "CHANGE_URL_VBHXH";

class BaseUrlHelperClImpl extends BaseUrlHelperCl {
  final AppHive _appHive;
  final AppNavigator _nav;
  final EnvConfig _envConfig;

  BaseUrlHelperClImpl(
    this._appHive,
    this._nav,
    this._envConfig,
  );

  @override
  Future<void> changeBaseUrl(String url) {
    return _appHive.put(HiveKeys.keyBaseUrl, url);
  }

  @override
  String get baseUrl {
    return _appHive.get<String>(HiveKeys.keyBaseUrl) ?? _envConfig.baseUrl;
  }

  @override
  Future<void> openChangeBaseUrlPage() async {
    final cbData = await Clipboard.getData(Clipboard.kTextPlain);
    if (cbData?.text == _kTriggerChangeBaseUrl) {
      _nav.toNamed(AppRoutesCl.changeBaseUrl.path);
    }
  }

  @override
  Future<void> resetBaseUrl() {
    return _appHive.delete(HiveKeys.keyBaseUrl);
  }
}
