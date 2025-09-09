import 'package:dio/dio.dart';

import '../../config/app_config.dart';
import '../../features/login/models/login_storage.dart';

class DioClient {
  static final Dio dio = Dio(
    BaseOptions(
      baseUrl: AppConfig.baseUrl,
      headers: {
        'Content-Type': 'application/json',
      },
    ),
  )..interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        final token = LoginStorage.getToken();

        print("Token gửi đi: $token"); // debug
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = token;
        }
        handler.next(options);
      },
    ));
}
