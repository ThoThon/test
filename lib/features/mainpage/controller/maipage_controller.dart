import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/remote/api_service.dart';
import '../models/product.dart';

class MainpageController extends GetxController {
  // Observable variables
  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool hasMore = true.obs;
  final RxString errorMessage = ''.obs;

  // Pagination
  int currentPage = 1;
  final int pageSize = 10;

  // Controllers for refresh
  final ScrollController scrollController = ScrollController();

  @override
  void onInit() {
    super.onInit();
    _setupScrollListener();
    loadProducts();
  }

  void _setupScrollListener() {
    scrollController.addListener(() {
      if (scrollController.position.pixels >=
          scrollController.position.maxScrollExtent - 200) {
        if (!isLoadingMore.value && hasMore.value) {
          loadMoreProducts();
        }
      }
    });
  }

  // Load products for first time or refresh
  Future<void> loadProducts() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';
      currentPage = 1;

      final response = await ApiService.getProducts(
        page: currentPage,
        limit: pageSize,
      );

      if (response.success && response.data != null) {
        products.value = response.data!;
        hasMore.value = response.data!.length == pageSize;
        currentPage++;
      } else {
        errorMessage.value = response.message.isNotEmpty
            ? response.message
            : 'Không thể tải danh sách sản phẩm';
      }
    } catch (e) {
      print('Error loading products: $e');
      errorMessage.value = 'Lỗi kết nối. Vui lòng thử lại!';
    } finally {
      isLoading.value = false;
    }
  }

  // Load more products (pagination)
  Future<void> loadMoreProducts() async {
    if (isLoadingMore.value || !hasMore.value) return;

    try {
      isLoadingMore.value = true;

      final response = await ApiService.getProducts(
        page: currentPage,
        limit: pageSize,
      );

      if (response.success && response.data != null) {
        if (response.data!.isNotEmpty) {
          products.addAll(response.data!);
          hasMore.value = response.data!.length == pageSize;
          currentPage++;
        } else {
          hasMore.value = false;
        }
      }
    } catch (e) {
      print('Error loading more products: $e');
      Get.snackbar(
        'Lỗi',
        'Không thể tải thêm sản phẩm',
        backgroundColor: Colors.red.withOpacity(0.8),
        colorText: Colors.white,
        duration: const Duration(seconds: 2),
      );
    } finally {
      isLoadingMore.value = false;
    }
  }

  // Pull to refresh
  Future<void> onRefresh() async {
    await loadProducts();
  }

  // Retry when error
  void retry() {
    loadProducts();
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}
