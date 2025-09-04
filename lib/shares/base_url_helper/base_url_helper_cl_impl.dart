import 'package:flutter/services.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/presentation/navigation/navigation_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/clean/shared/config/env_config.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/core/values/hive_key.dart';
import 'package:v_bhxh/env/env_uat.dart';
import 'package:v_bhxh/shares/base_url_helper/base_url_helper_cl.dart';

const String _kTriggerChangeBaseUrl = "CHANGE_URL_VBHXH";

class BaseUrlHelperClImpl extends BaseUrlHelperCl {
  final AppHive _appHive;
  final AppNavigator _nav;
  final EnvConfig _envConfig;

  late final _authApiClient = sl<AuthAppServerApiClient>();
  late final _authUploadApiClient = sl<AuthAppUploadApiClient>();
  late final _nonAuthApiClient = sl<NonAuthAppServerApiClient>();

  BaseUrlHelperClImpl(
    this._appHive,
    this._nav,
    this._envConfig,
  );

  @override
  Future<void> changeBaseUrl(String url) {
    // Update baseUrl for api clients
    _changeBaseUrlForApiClients(url);

    // Save new baseUrl to local storage
    return _appHive.put(HiveKeys.keyBaseUrl, url);
  }

  @override
  Future<void> switchToUatEnv() {
    final baseUatUrl = EnvUat.baseUrl;
    // Update baseUrl for api clients
    _changeBaseUrlForApiClients(baseUatUrl);
    // Save new baseUrl to local storage
    return _appHive.put(HiveKeys.keyBaseUrl, EnvUat.baseUrl);
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
    // Reset baseUrl for api clients
    _changeBaseUrlForApiClients(_envConfig.baseUrl);

    // Remove saved baseUrl from local storage
    return _appHive.delete(HiveKeys.keyBaseUrl);
  }

  void _changeBaseUrlForApiClients(String url) {
    _authApiClient.dio.options.baseUrl = url;
    _authUploadApiClient.dio.options.baseUrl = url;
    _nonAuthApiClient.dio.options.baseUrl = url;
  }
}
