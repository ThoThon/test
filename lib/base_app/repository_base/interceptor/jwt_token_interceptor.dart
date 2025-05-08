import 'package:v_bhxh/base_app/controllers_base/app_controller/app_controller.dart';
import 'package:v_bhxh/core/values/hive_key.dart';
import 'package:v_bhxh/shares/shares.src.dart';

class JwtTokenInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final jwtToken = hiveApp.get(HiveKeys.keyJwtToken);
    if (jwtToken != null && jwtToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $jwtToken';
    }

    handler.next(options);
  }
}
