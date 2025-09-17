import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../mainpage/models/product_model.dart';
import '../models/cart_item.dart';
import '../models/cart_storage.dart';

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[].obs;
  final RxInt totalItems = 0.obs;
  final RxInt totalPrice = 0.obs;

  @override
  void onInit() {
    super.onInit();
    loadCartItems();
  }

  void loadCartItems() {
    cartItems.assignAll(CartStorage.getCartItems());
    _updateTotals();
  }

  Future<void> addToCart(Product product, {int quantity = 1}) async {
    try {
      final cartItem = CartItem(
        productId: product.id,
        name: product.name,
        price: product.price,
        cover: product.cover,
        quantity: quantity,
      );

      await CartStorage.addToCart(cartItem);
      loadCartItems();
    } catch (e) {
      _showError("Không thể thêm sản phẩm vào giỏ hàng");
    }
  }

  Future<void> removeFromCart(int productId) async {
    try {
      await CartStorage.removeFromCart(productId);
      loadCartItems();
    } catch (e) {
      _showError("Không thể xóa sản phẩm");
    }
  }

  Future<void> updateQuantity(int productId, int newQuantity) async {
    try {
      await CartStorage.updateQuantity(productId, newQuantity);
      loadCartItems();
    } catch (e) {
      _showError("Không thể cập nhật số lượng");
    }
  }

  Future<void> clearCart() async {
    final confirm = await Get.dialog<bool>(
      AlertDialog(
        title: const Text("Xác nhận"),
        content: const Text("Bạn có chắc muốn xóa tất cả sản phẩm?"),
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text("Hủy"),
          ),
          TextButton(
            onPressed: () => Get.back(result: true),
            child: const Text("Xóa", style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );

    if (confirm == true) {
      try {
        await CartStorage.clearCart();
        loadCartItems();
      } catch (e) {
        _showError("Không thể xóa giỏ hàng");
      }
    }
  }

  void _updateTotals() {
    totalItems.value = CartStorage.itemCount;
    totalPrice.value = CartStorage.totalPrice;
  }

  bool isInCart(int productId) {
    return cartItems.any((item) => item.productId == productId);
  }

  CartItem? getCartItem(int productId) {
    try {
      return cartItems.firstWhere((item) => item.productId == productId);
    } catch (e) {
      return null;
    }
  }

  void _showError(String message) {
    Get.snackbar(
      "Lỗi",
      message,
      backgroundColor: Colors.red,
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}
