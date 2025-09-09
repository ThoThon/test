import '../features/mainpage/models/product_model.dart';
import '../services/remote/product_apiservice.dart';

class ProductRepository {
  // Lấy danh sách sản phẩm với phân trang
  static Future<List<Product>> getProducts({
    required int page,
    int size = 10,
  }) async {
    try {
      final response = await ProductApiService.getProducts(
        page: page,
        size: size,
      );

      if (response.success && response.data != null) {
        return response.data!;
      }

      return [];
    } catch (e) {
      print('Lỗi trong ProductRepository.getProducts: $e');
      rethrow;
    }
  }

  // Tải thêm sản phẩm (wrapper cho getProducts)
  static Future<List<Product>> loadMoreProducts({
    required int page,
    int size = 10,
  }) async {
    return await getProducts(page: page, size: size);
  }

  // Làm mới danh sách sản phẩm (trang đầu tiên)
  static Future<List<Product>> refreshProducts({int size = 10}) async {
    return await getProducts(page: 1, size: size);
  }
}
