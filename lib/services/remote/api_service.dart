import 'package:dio/dio.dart';

import '../../modules/login/models/login/login_storage.dart';
import 'dio_client.dart';

class ApiService {
  static Future<Map<String, dynamic>> login({
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
    return response.data;
  }

  static Future<Map<String, dynamic>> callApiWithToken(String endpoint) async {
    String? token = LoginStorage.getToken();
    final response = await DioClient.dio.get(
      endpoint,
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );
    return response.data;
  }
}
