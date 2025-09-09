import 'package:get/get.dart';

import '../../../repositories/product_repository.dart';
import '../models/product_model.dart';

class MainpageController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var page = 1;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts({bool refresh = false}) async {
    if (isLoading.value) return;

    if (refresh) {
      page = 1;
      products.clear();
      hasMore.value = true;
    }

    if (!hasMore.value && !refresh) return;

    isLoading.value = true;
    try {
      final List<Product> newProducts;

      if (refresh) {
        newProducts = await ProductRepository.refreshProducts();
      } else {
        newProducts = await ProductRepository.loadMoreProducts(page: page);
      }

      if (refresh) {
        products.assignAll(newProducts);
      } else {
        products.addAll(newProducts);
      }

      if (newProducts.length < 10) {
        hasMore.value = false;
      }

      page++;
    } catch (e) {
      print("Lỗi fetchProducts: $e");
      hasMore.value = false;
    } finally {
      isLoading.value = false;
    }
  }

  void loadMore() {
    if (!isLoading.value && hasMore.value) {
      fetchProducts();
    }
  }
}
