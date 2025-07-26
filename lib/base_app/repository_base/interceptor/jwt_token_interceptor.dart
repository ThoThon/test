import 'package:v_bhxh/clean/core/data/data_source/local/app_hive.dart';
import 'package:v_bhxh/core/values/hive_key.dart';

import '../../../shares/package/export_package.dart';

class JwtTokenInterceptor extends InterceptorsWrapper {
  @override
  Future<void> onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    final jwtToken = AppHive.instance.get(HiveKeys.keyJwtToken);
    if (jwtToken != null && jwtToken.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $jwtToken';
    }

    handler.next(options);
  }
}
