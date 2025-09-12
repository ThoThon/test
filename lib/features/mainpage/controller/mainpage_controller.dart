import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../repositories/product_repository.dart';
import '../models/product_model.dart';

class MainpageController extends GetxController {
  var products = <Product>[].obs;
  var isLoading = false.obs;

  // Pagination
  var currentPage = 1;
  var hasMoreData = true.obs;
  final int pageSize = 10;

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
      final result = await ProductRepository.getProducts(
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

  /// Pull to refresh
  Future<void> onRefresh() async {
    try {
      currentPage = 1;
      hasMoreData.value = true;

      final result = await ProductRepository.getProducts(
        page: 1,
        size: pageSize,
      );

      products.assignAll(result.products);
      hasMoreData.value = result.hasMore;

      if (result.products.isNotEmpty) {
        currentPage = 2;
      }

      refreshController.resetNoData();
      refreshController.refreshCompleted();
    } catch (e) {
      print("Lỗi onRefresh: $e");
      refreshController.refreshFailed();
      _showErrorSnackbar("Không thể làm mới dữ liệu");
    }
  }

  /// Load more
  Future<void> onLoadMore() async {
    if (!hasMoreData.value) {
      refreshController.loadNoData();
      return;
    }

    try {
      final result = await ProductRepository.getProducts(
        page: currentPage,
        size: pageSize,
      );

      if (result.products.isNotEmpty) {
        products.addAll(result.products);
        currentPage++;
        refreshController.loadComplete();
      }

      hasMoreData.value = result.hasMore;
      if (!result.hasMore) {
        refreshController.loadNoData();
      }
    } catch (e) {
      print("Lỗi onLoadMore: $e");
      refreshController.loadFailed();
      _showErrorSnackbar("Không thể tải thêm dữ liệu");
    }
  }

  /// Cập nhật sản phẩm trong danh sách local
  void updateProductInList(Product updatedProduct) {
    final index = products.indexWhere((p) => p.id == updatedProduct.id);
    if (index != -1) {
      products[index] = updatedProduct;
    }
  }

  /// Xóa sản phẩm khỏi danh sách local
  void removeProductFromList(int productId) {
    products.removeWhere((product) => product.id == productId);
  }

  void _showErrorSnackbar(String message) {
    Get.snackbar(
      "Lỗi",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.TOP,
      duration: const Duration(seconds: 3),
    );
  }
}
