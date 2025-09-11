import 'package:dio/dio.dart';

import '../../features/login/models/login_storage.dart';

class AccessTokenInterceptor extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final token = LoginStorage.getToken();

    print("Token gửi đi: $token"); // debug
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = token;
    }

    super.onRequest(options, handler);
  }
}
