import 'package:get/get.dart';

import '../../../services/remote/api_service.dart';
import '../product_model.dart';

class MainpageController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var page = 1;

  Future<void> fetchProducts({bool refresh = false}) async {
    if (refresh) {
      page = 1;
      products.clear();
    }

    isLoading.value = true;
    try {
      final response = await ApiService.getProducts(page: page);
      if (response.data != null) {
        products.addAll(response.data!);
        page++;
      }
    } catch (e) {
      print("Lỗi: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
