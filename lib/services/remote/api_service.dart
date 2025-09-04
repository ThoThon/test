import 'package:dio/dio.dart';

import '../../features/login/models/login_response.dart';
import '../../features/login/models/login_storage.dart';
import 'base_response.dart';
import 'dio_client.dart';

class ApiService {
  static Future<BaseResponse<LoginResponse>> login({
    required String taxCode,
    required String username,
    required String password,
  }) async {
    final response = await DioClient.dio.post(
      '/login2',
      data: {
        'tax_code': int.tryParse(taxCode),
        'user_name': username,
        'password': password,
      },
    );

    return BaseResponse<LoginResponse>.fromJson(
      response.data,
      func: (json) => LoginResponse.fromJson(json),
    );
  }

  static Future<BaseResponse<T>> callApiWithToken<T>({
    required String endpoint,
    T Function(dynamic json)? func,
  }) async {
    String? token = LoginStorage.getToken();

    final response = await DioClient.dio.get(
      endpoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return BaseResponse<T>.fromJson(
      response.data,
      func: func,
    );
  }
}
