// lib/services/remote/auth_interceptor.dart
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../features/login/models/login_storage.dart';
import '../../routes/app_routes.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // Lấy token từ Hive
    final token = LoginStorage.getToken();

    // Tự động thêm token vào header nếu có
    if (token != null && token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
    }

    print('🚀 Request: ${options.method} ${options.path}');
    print('📋 Headers: ${options.headers}');

    super.onRequest(options, handler);
  }

  @override
  void onResponse(response, ResponseInterceptorHandler handler) {
    print('✅ Response: ${response.statusCode} ${response.requestOptions.path}');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    print('❌ Error: ${err.response?.statusCode} ${err.requestOptions.path}');

    // Tự động logout nếu token hết hạn (401)
    if (err.response?.statusCode == 401) {
      _handleUnauthorized();
    }

    super.onError(err, handler);
  }

  void _handleUnauthorized() async {
    print('🔒 Token expired, logging out...');
    await LoginStorage.clearLoginInfo();
    Get.offAllNamed(Routes.login);
  }
}
