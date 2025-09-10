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

  //API chi tiết sản phẩm
  static Future<BaseResponse<Product>> getProductDetail({
    required int productId,
  }) async {
    final response = await DioClient.dio.get(
      "/products/$productId",
    );

    return BaseResponse<Product>.fromJson(
      response.data,
      func: (json) => Product.fromJson(json),
    );
  }

  // API cập nhật sản phẩm
  static Future<BaseResponse<Product>> updateProduct({
    required int productId,
    required String name,
    required int price,
    required int quantity,
    required String cover,
  }) async {
    final response = await DioClient.dio.put(
      "/products/$productId",
      data: {
        'name': name,
        'price': price,
        'quantity': quantity,
        'cover': cover,
      },
    );

    return BaseResponse<Product>.fromJson(
      response.data,
      func: (json) => Product.fromJson(json),
    );
  }

  // API xóa sản phẩm
  static Future<BaseResponse<dynamic>> deleteProduct({
    required int productId,
  }) async {
    final response = await DioClient.dio.delete(
      "/products/$productId",
    );

    return BaseResponse<dynamic>.fromJson(response.data);
  }
}
