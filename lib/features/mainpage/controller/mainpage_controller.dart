import 'package:get/get.dart';
import '../models/product_model.dart';
import '../services/product_service.dart';

class MainpageController extends GetxController {
  final ProductService _productService = ProductService();

  final RxList<Product> products = <Product>[].obs;
  final RxBool isLoading = false.obs;
  final RxBool isLoadingMore = false.obs;
  final RxBool hasReachedMax = false.obs;
  final RxString errorMessage = ''.obs;

  int _currentPage = 0;
  static const int _limit = 10;
  int _totalProducts = 0;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  Future<void> loadProducts({bool refresh = false}) async {
    if (refresh) {
      _currentPage = 0;
      products.clear();
      hasReachedMax.value = false;
    }

    if (isLoading.value || hasReachedMax.value) return;

    try {
      if (_currentPage == 0) {
        isLoading.value = true;
        errorMessage.value = '';
      } else {
        isLoadingMore.value = true;
      }

      final newProducts = await _productService.getProducts(
        limit: _limit,
        skip: _currentPage * _limit,
      );

      if (refresh) {
        products.assignAll(newProducts);
      } else {
        products.addAll(newProducts);
      }

      _currentPage++;

      // Check if we've reached the end
      if (newProducts.length < _limit) {
        hasReachedMax.value = true;
      }

      // Get total count on first load
      if (_currentPage == 1) {
        _totalProducts = await _productService.getTotalProducts();
      }
    } catch (e) {
      errorMessage.value = e.toString();
    } finally {
      isLoading.value = false;
      isLoadingMore.value = false;
    }
  }

  Future<void> refreshProducts() async {
    await loadProducts(refresh: true);
  }

  Future<void> loadMoreProducts() async {
    if (!hasReachedMax.value && !isLoadingMore.value) {
      await loadProducts();
    }
  }

  bool get canLoadMore => !hasReachedMax.value && !isLoadingMore.value;
  int get totalProducts => _totalProducts;
  int get currentPage => _currentPage;
}
