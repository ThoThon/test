import 'package:dio/dio.dart';
import '../models/product_model.dart';

class ProductService {
  static const String baseUrl = 'https://training-api-unrp.onrender.com';
  final Dio _dio = Dio();

  Future<List<Product>> getProducts({int limit = 10, int skip = 0}) async {
    try {
      final response = await _dio.get(
        '$baseUrl/products',
        queryParameters: {
          'limit': limit,
          'skip': skip,
        },
      );

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.map((json) => Product.fromJson(json)).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error: $e');
    }
  }

  Future<int> getTotalProducts() async {
    try {
      final response = await _dio.get('$baseUrl/products');

      if (response.statusCode == 200) {
        final List<dynamic> data = response.data['data'] ?? [];
        return data.length;
      } else {
        return 0;
      }
    } catch (e) {
      return 0;
    }
  }
}
