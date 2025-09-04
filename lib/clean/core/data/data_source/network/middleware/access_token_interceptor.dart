import 'package:dio/dio.dart';
import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/core/values/hive_key.dart';

class AccessTokenInterceptor extends BaseInterceptor {
  AccessTokenInterceptor(this._appHive);

  final AppHive _appHive;

  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final accessToken = _appHive.get<String>(HiveKeys.keyJwtToken);
    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $accessToken';
    }

    handler.next(options);
  }
}
