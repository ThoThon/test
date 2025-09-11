// lib/features/mainpage/controller/mainpage_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../repositories/product_repository.dart';
import '../models/product_model.dart';

class MainpageController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;
  var hasMore = true.obs;
  var page = 1;

  // Pull to refresh controller
  late RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    fetchProducts();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
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

  // Xử lý pull to refresh
  Future<void> onRefresh() async {
    await fetchProducts(refresh: true);
    refreshController.refreshCompleted();
  }

  // Xử lý load more
  Future<void> onLoadMore() async {
    if (!hasMore.value) {
      refreshController.loadNoData();
      return;
    }

    await fetchProducts();

    if (hasMore.value) {
      refreshController.loadComplete();
    } else {
      refreshController.loadNoData();
    }
  }

  void loadMore() {
    if (!isLoading.value && hasMore.value) {
      fetchProducts();
    }
  }

  // Method để refresh từ bên ngoài (khi có update/delete)
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

  // Method để xóa sản phẩm khỏi danh sách local (không cần gọi API)
  void removeProductFromList(int productId) {
    products.removeWhere((product) => product.id == productId);
  }

  // Method để cập nhật sản phẩm trong danh sách local
  void updateProductInList(Product updatedProduct) {
    final index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
    }
  }
}
