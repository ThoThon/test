// lib/features/mainpage/controller/mainpage_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../repositories/product_repository.dart';
import '../models/product_model.dart';

class MainpageController extends GetxController {
  // Danh sách sản phẩm
  var products = <Product>[].obs;

  // Trạng thái loading
  var isLoading = false.obs;
  var isLoadingMore = false.obs;

  // Pagination
  var currentPage = 1;
  var hasMoreData = true.obs;
  final int pageSize = 10;

  // Pull to refresh controller
  late RefreshController refreshController;

  @override
  void onInit() {
    super.onInit();
    refreshController = RefreshController(initialRefresh: false);
    fetchProducts(isInitial: true);
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  /// Lấy danh sách sản phẩm
  Future<void> fetchProducts({bool isInitial = false}) async {
    if (isInitial) {
      isLoading.value = true;
      currentPage = 1;
      hasMoreData.value = true;
    }

    try {
      final result = await ProductRepository.getProductsWithPagination(
        page: currentPage,
        size: pageSize,
      );

      if (isInitial) {
        products.assignAll(result.products);
      } else {
        products.addAll(result.products);
      }

      hasMoreData.value = result.hasMore;

      if (result.products.isNotEmpty) {
        currentPage++;
      }
    } catch (e) {
      print("Lỗi fetchProducts: $e");
      _showErrorSnackbar("Có lỗi xảy ra khi tải dữ liệu");
    } finally {
      if (isInitial) {
        isLoading.value = false;
      }
    }
  }

  /// Xử lý pull to refresh
  Future<void> onRefresh() async {
    try {
      currentPage = 1;
      hasMoreData.value = true;

      final result = await ProductRepository.getProductsWithPagination(
        page: 1,
        size: pageSize,
      );

      products.assignAll(result.products);
      hasMoreData.value = result.hasMore;
      currentPage = 2;

      refreshController.refreshCompleted();

      if (result.products.isNotEmpty) {
        _showSuccessSnackbar("Đã cập nhật danh sách sản phẩm");
      }
    } catch (e) {
      print("Lỗi onRefresh: $e");
      refreshController.refreshFailed();
      _showErrorSnackbar("Không thể làm mới dữ liệu");
    }
  }

  /// Xử lý load more
  Future<void> onLoadMore() async {
    if (!hasMoreData.value) {
      refreshController.loadNoData();
      return;
    }

    try {
      isLoadingMore.value = true;

      final result = await ProductRepository.getProductsWithPagination(
        page: currentPage,
        size: pageSize,
      );

      if (result.products.isNotEmpty) {
        products.addAll(result.products);
        currentPage++;
        refreshController.loadComplete();
      } else {
        hasMoreData.value = false;
        refreshController.loadNoData();
      }

      hasMoreData.value = result.hasMore;
    } catch (e) {
      print("Lỗi onLoadMore: $e");
      refreshController.loadFailed();
      _showErrorSnackbar("Không thể tải thêm dữ liệu");
    } finally {
      isLoadingMore.value = false;
    }
  }

  /// Làm mới sau khi có thao tác update/delete
  Future<void> refreshAfterAction({String? message}) async {
    try {
      currentPage = 1;
      hasMoreData.value = true;

      final result = await ProductRepository.getProductsWithPagination(
        page: 1,
        size: pageSize,
      );

      products.assignAll(result.products);
      hasMoreData.value = result.hasMore;
      currentPage = 2;

      if (message != null) {
        _showSuccessSnackbar(message);
      }
    } catch (e) {
      print("Lỗi refreshAfterAction: $e");
      _showErrorSnackbar("Không thể cập nhật danh sách");
    }
  }

  /// Xóa sản phẩm khỏi danh sách local
  void removeProductFromList(int productId) {
    products.removeWhere((product) => product.id == productId);
  }

  /// Cập nhật sản phẩm trong danh sách local
  void updateProductInList(Product updatedProduct) {
    final index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
    }
  }

  /// Reset refresh controller state
  void resetRefreshController() {
    refreshController.resetNoData();
  }

  /// Hiển thị snackbar thành công
  void _showSuccessSnackbar(String message) {
    Get.snackbar(
      "Thành công",
      message,
      backgroundColor: Colors.green,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 2),
      icon: const Icon(Icons.check_circle, color: Colors.white),
    );
  }

  /// Hiển thị snackbar lỗi
  void _showErrorSnackbar(String message) {
    Get.snackbar(
      "Lỗi",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.error, color: Colors.white),
    );
  }
}
