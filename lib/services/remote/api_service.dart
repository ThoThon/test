// lib/services/remote/api_service.dart
import 'package:test_getx/features/mainpage/product_models.dart';

import '../../features/login/models/login_response.dart';
import 'base_response.dart';
import 'dio_client.dart';

class ApiService {
  // Login API (không cần token)
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

  // Các API khác - Token sẽ TỰ ĐỘNG được thêm bởi AuthInterceptor
  static Future<BaseResponse<T>> get<T>({
    required String endpoint,
    T Function(dynamic json)? func,
    Map<String, dynamic>? queryParameters,
  }) async {
    final response = await DioClient.dio.get(
      endpoint,
      queryParameters: queryParameters,
    );

    return BaseResponse<T>.fromJson(
      response.data,
      func: func,
    );
  }

  static Future<BaseResponse<T>> post<T>({
    required String endpoint,
    dynamic data,
    T Function(dynamic json)? func,
  }) async {
    final response = await DioClient.dio.post(
      endpoint,
      data: data,
    );

    return BaseResponse<T>.fromJson(
      response.data,
      func: func,
    );
  }

  static Future<BaseResponse<T>> put<T>({
    required String endpoint,
    dynamic data,
    T Function(dynamic json)? func,
  }) async {
    final response = await DioClient.dio.put(
      endpoint,
      data: data,
    );

    return BaseResponse<T>.fromJson(
      response.data,
      func: func,
    );
  }

  static Future<BaseResponse<T>> delete<T>({
    required String endpoint,
    T Function(dynamic json)? func,
  }) async {
    final response = await DioClient.dio.delete(endpoint);

    return BaseResponse<T>.fromJson(
      response.data,
      func: func,
    );
  }

  // Example usage cho các API cần token
  static Future<BaseResponse<List<dynamic>>> getUserData() async {
    return await get(
      endpoint: '/user/profile',
      func: (json) => json as List<dynamic>,
    );
  }

  static Future<BaseResponse<Map<String, dynamic>>> updateProfile({
    required Map<String, dynamic> profileData,
  }) async {
    return await put(
      endpoint: '/user/profile',
      data: profileData,
      func: (json) => json as Map<String, dynamic>,
    );
  }

  static Future<BaseResponse<List<Product>>> getProducts({
    int page = 1,
    int size = 10,
  }) async {
    final response = await DioClient.dio.get(
      '/products', // hoặc endpoint API của bạn
      queryParameters: {
        'page': page,
        'size': size,
      },
    );

    return BaseResponse<List<Product>>.fromJson(
      response.data,
      func: (json) {
        if (json is List) {
          return json.map((item) => Product.fromJson(item)).toList();
        }
        return <Product>[];
      },
    );
  }
}
