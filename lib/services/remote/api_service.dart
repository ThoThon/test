import 'package:dio/dio.dart';

import '../../features/login/models/login_response.dart';
import '../../features/login/models/login_storage.dart';
import '../../features/mainpage/product_model.dart';
import 'base_response.dart';
import 'dio_client.dart';

class ApiService {
  /// Đăng nhập
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

  /// Lấy danh sách sản phẩm (đã tự gắn token từ interceptor)
  static Future<BaseResponse<List<Product>>> getProducts({
    required int page,
    required int size,
  }) async {
    final token = LoginStorage.getToken(); // lấy token đã lưu sau login
    final response = await DioClient.dio.get(
      '/products',
      queryParameters: {
        'page': page,
        'size': size,
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
        },
      ),
    );

    return BaseResponse<List<Product>>.fromJson(
      response.data,
      func: (json) {
        if (json is List) {
          return json.map((e) => Product.fromJson(e)).toList();
        }
        return [];
      },
    );
  }
}
