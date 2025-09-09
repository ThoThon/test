import '../../features/mainpage/models/product_model.dart';
import 'base_response.dart';
import 'dio_client.dart';

class ProductApiService {
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
