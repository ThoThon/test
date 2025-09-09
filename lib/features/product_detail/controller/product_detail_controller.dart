import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repositories/product_repository.dart';
import '../../mainpage/models/product_model.dart';

class ProductDetailController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxString errorMessage = ''.obs;
  final Rx<Product?> productDetail = Rx<Product?>(null);

  int? productId;

  @override
  void onInit() {
    super.onInit();
    // Lấy productId từ arguments
    final args = Get.arguments;
    if (args != null && args is Map<String, dynamic>) {
      productId = args['productId'];
      if (productId != null) {
        fetchProductDetail();
      } else {
        errorMessage.value = "ID sản phẩm không hợp lệ";
      }
    } else {
      errorMessage.value = "Không tìm thấy thông tin sản phẩm";
    }
  }

  Future<void> fetchProductDetail() async {
    if (productId == null) return;

    isLoading.value = true;
    errorMessage.value = '';

    try {
      final detail = await ProductRepository.getProductDetail(
        productId: productId!,
      );

      if (detail != null) {
        productDetail.value = detail;
      } else {
        errorMessage.value = "Không tìm thấy thông tin sản phẩm";
      }
    } catch (e) {
      print('Lỗi fetchProductDetail: $e');
      errorMessage.value = "Có lỗi xảy ra khi tải dữ liệu";
    } finally {
      isLoading.value = false;
    }
  }

  void onBackPressed() {
    Get.back();
  }

  void showErrorDialog() {
    Get.defaultDialog(
      title: "Lỗi",
      middleText: errorMessage.value,
      backgroundColor: Colors.white,
      titleStyle: const TextStyle(color: Colors.black),
      middleTextStyle: const TextStyle(color: Colors.black),
      radius: 15,
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          style: TextButton.styleFrom(
            foregroundColor: Colors.white,
            backgroundColor: const Color(0xFFf24e1e),
          ),
          child: const Text("Đóng"),
        ),
      ],
    );
  }
}
