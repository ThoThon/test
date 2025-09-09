import '../../features/login/models/login_info.dart';
import '../../features/login/models/login_response.dart';
import '../../features/login/models/login_storage.dart';
import '../../features/mainpage/product_model.dart';
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

    final result = BaseResponse<LoginResponse>.fromJson(
      response.data,
      func: (json) => LoginResponse.fromJson(json),
    );

    if (result.success && result.data != null) {
      final token = result.data!.token;

      await LoginStorage.saveLoginInfo(
        LoginInfo(
          username: username,
          password: password,
          taxCode: taxCode,
          token: token,
        ),
      );

      print("✅ Token đã lưu Hive: $token");
    }

    return result;
  }

  static Future<BaseResponse<List<Product>>> getProducts({
    required int page,
    int size = 10,
  }) async {
    final response = await DioClient.dio.get(
      "/products?page=$page&size=$size",
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
