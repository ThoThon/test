import 'package:dio/dio.dart';
import 'package:hive/hive.dart';
import '../storage/token_storage.dart';

class ApiClient {
  static final ApiClient _instance = ApiClient._internal();
  factory ApiClient() => _instance;
  late final Dio dio;

  ApiClient._internal() {
    final options = BaseOptions(
      baseUrl: 'https://training-api-unrp.onrender.com',
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    dio = Dio(options);

    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Read token from Hive and add to Authorization header if present
        try {
          final token = await TokenStorage.getToken();
          if (token != null && token.isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          }
        } catch (e) {
          // If anything goes wrong reading token, proceed without token
        }
        handler.next(options);
      },
      onError: (DioError error, handler) {
        handler.next(error);
      },
    ));
  }
}