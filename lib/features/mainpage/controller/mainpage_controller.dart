import 'package:flutter/material.dart';
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

  // ✅ Method để refresh từ bên ngoài (khi có update/delete)
  Future<void> refreshAfterAction({String? message}) async {
    await fetchProducts(refresh: true);

    if (message != null) {
      Get.snackbar(
        "Cập nhật",
        message,
        backgroundColor: const Color(0xFFf24e1e),
        colorText: Colors.white,
        snackPosition: SnackPosition.TOP,
        duration: const Duration(seconds: 2),
      );
    }
  }

  // ✅ Method để xóa sản phẩm khỏi danh sách local (không cần gọi API)
  void removeProductFromList(int productId) {
    products.removeWhere((product) => product.id == productId);
  }

  // ✅ Method để cập nhật sản phẩm trong danh sách local
  void updateProductInList(Product updatedProduct) {
    final index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
    }
  }
}
