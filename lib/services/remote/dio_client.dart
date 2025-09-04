// lib/services/remote/dio_client.dart
import 'package:dio/dio.dart';

import '../../config/app_config.dart';
import 'auth_interceptor.dart';

class DioClient {
  static late Dio _dio;

  static Dio get dio => _dio;

  static void init() {
    _dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.baseUrl,
        headers: {
          'Content-Type': 'application/json',
        },
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );

    // Thêm Auth Interceptor
    _dio.interceptors.add(AuthInterceptor());

    // Thêm LogInterceptor để debug (optional)
    _dio.interceptors.add(
      LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: false,
        responseBody: true,
        error: true,
      ),
    );
  }
}
