import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test_getx/features/mainpage/product_models.dart';

import '../../../services/remote/api_service.dart';

class MainpageController extends GetxController {
  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool hasMoreData = true.obs;
  final RxString errorMessage = ''.obs;

  final int pageSize = 10;
  int currentPage = 1;

  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    loadProducts();
    setupScrollListener();
  }

  void setupScrollListener() {
    scrollController.addListener(() {
      // Khi scroll gần đến cuối (80% chiều cao)
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent * 0.8) {
        if (!isLoadingMore.value && hasMoreData.value) {
          loadMoreProducts();
        }
      }
    });
  }

  Future<void> loadProducts({bool isRefresh = false}) async {
    if (isRefresh) {
      currentPage = 1;
      hasMoreData.value = true;
      products.clear();
      errorMessage.value = '';
    }

    isLoading.value = true;

    try {
      final response = await ApiService.getProducts(
        page: currentPage,
        size: pageSize,
      );

      if (response.success && response.data != null) {
        final newProducts = response.data!;

        if (isRefresh) {
          products.assignAll(newProducts);
        } else {
          products.addAll(newProducts);
        }

        // Kiểm tra còn data không
        if (newProducts.length < pageSize) {
          hasMoreData.value = false;
        }

        currentPage++;
        errorMessage.value = '';
      } else {
        errorMessage.value = response.message.isNotEmpty
            ? response.message
            : "Không thể tải danh sách sản phẩm";
      }
    } catch (e) {
      print('Lỗi load products: $e');
      errorMessage.value = "Lỗi kết nối. Vui lòng thử lại.";
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> loadMoreProducts() async {
    if (isLoadingMore.value || !hasMoreData.value) return;

    isLoadingMore.value = true;

    try {
      final response = await ApiService.getProducts(
        page: currentPage,
        size: pageSize,
      );

      if (response.success && response.data != null) {
        final newProducts = response.data!;

        products.addAll(newProducts);

        if (newProducts.length < pageSize) {
          hasMoreData.value = false;
        }

        currentPage++;
      }
    } catch (e) {
      print('Lỗi load more: $e');
    } finally {
      isLoadingMore.value = false;
    }
  }

  Future<void> refreshProducts() async {
    await loadProducts(isRefresh: true);
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
