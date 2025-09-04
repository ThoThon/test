import 'package:get/get.dart';
import 'package:test_getx/features/mainpage/product_model.dart';

import '../../../services/remote/api_service.dart';

class MainPageController extends GetxController {
  var products = <Product>[].obs;
  var page = 1;
  final size = 10;

  var isLoading = false.obs;
  var isRefreshing = false.obs;
  var hasMore = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  Future<void> fetchProducts({bool loadMore = false}) async {
    if (isLoading.value) return;
    if (loadMore && !hasMore.value) return;

    isLoading.value = true;

    try {
      print("📍 Gọi API page=$page size=$size");
      final res = await ApiService.getProducts(page: page, size: size);
      print(
          "✅ success=${res.success}, message=${res.message}, data=${res.data}");

      print("📍 Gọi API page=$page size=$size");
      print("📄 Response success: ${res.success}");
      print("📦 Data: ${res.data}");

      if (res.success) {
        final newProducts = res.data ?? [];

        if (loadMore) {
          if (newProducts.isEmpty) {
            hasMore.value = false;
          } else {
            products.addAll(newProducts);
            page++;
          }
        } else {
          products.assignAll(newProducts);
          page = 2;
          hasMore.value = true;
        }
      }
    } finally {
      isLoading.value = false;
      isRefreshing.value = false;
    }
  }

  Future<void> refreshProducts() async {
    isRefreshing.value = true;
    page = 1;
    await fetchProducts();
  }
}
