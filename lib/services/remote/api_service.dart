import 'package:dio/dio.dart';

import '../../features/login/models/login/login_storage.dart';
import 'base_response.dart';
import 'dio_client.dart';

class ApiService {
  static Future<BaseResponse<String>> login({
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
    String? token;
    if (response.data['data'] != null) {
      token = response.data['data']['token'];
    }
    return BaseResponse<String>(
      success: response.data['success'] ?? false,
      message: response.data['message'] ?? '',
      data: token,
    );
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
