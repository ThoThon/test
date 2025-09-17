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
  final int pageSize = 10;
  static const int defaultPageNumber = 1;

  final refreshController = RefreshController(initialRefresh: false);

  @override
  void onInit() {
    super.onInit();
    fetchProducts();
  }

  @override
  void onClose() {
    refreshController.dispose();
    super.onClose();
  }

  /// Lấy danh sách sản phẩm
  Future<void> fetchProducts({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      isLoading.value = true;
    }

    try {
      final page = isLoadMore ? currentPage + 1 : defaultPageNumber;

      final result = await ProductRepository.getProducts(
        page: page,
        size: pageSize,
      );

      if (isLoadMore) {
        products.addAll(result.products);
      } else {
        products.assignAll(result.products);
      }

      // Chỉ cập nhật currentPage khi load thành công
      currentPage = page;
    } catch (e) {
      print("Lỗi fetchProducts: $e");
      _showErrorSnackbar("Có lỗi xảy ra khi tải dữ liệu");
    } finally {
      if (isLoadMore) {
        refreshController.loadComplete();
      } else {
        isLoading.value = false;
        refreshController.refreshCompleted();
      }
    }
  }

  /// Pull to refresh
  Future<void> onRefresh() async {
    await fetchProducts(isLoadMore: false);
  }

  /// Load more
  Future<void> onLoadMore() async {
    await fetchProducts(isLoadMore: true);
  }

  /// Thêm sản phẩm mới vào đầu danh sách
  void addNewProductToList(Product newProduct) {
    products.insert(0, newProduct);
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
