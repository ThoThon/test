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
      print('Lỗi addToCart: $e');
      Get.snackbar(
        "Lỗi",
        "Không thể thêm sản phẩm vào giỏ hàng",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> removeFromCart(int productId) async {
    try {
      await CartStorage.removeFromCart(productId);
      loadCartItems();
    } catch (e) {
      print('Lỗi removeFromCart: $e');
      Get.snackbar(
        "Lỗi",
        "Không thể xóa sản phẩm",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  Future<void> updateQuantity(int productId, int newQuantity) async {
    try {
      await CartStorage.updateQuantity(productId, newQuantity);
      loadCartItems();
    } catch (e) {
      print('Lỗi updateQuantity: $e');
    }
  }

  Future<void> clearCart() async {
    try {
      final confirm = await Get.defaultDialog<bool>(
        title: "Xác nhận",
        middleText: "Bạn có chắc chắn muốn xóa tất cả sản phẩm trong giỏ hàng?",
        backgroundColor: Colors.white,
        titleStyle:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        middleTextStyle: const TextStyle(color: Colors.black),
        radius: 15,
        actions: [
          TextButton(
            onPressed: () => Get.back(result: false),
            child: const Text("Hủy", style: TextStyle(color: Colors.grey)),
          ),
          ElevatedButton(
            onPressed: () => Get.back(result: true),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: const Text("Xóa tất cả"),
          ),
        ],
      );

      if (confirm == true) {
        await CartStorage.clearCart();
        loadCartItems();
      }
    } catch (e) {
      print('Lỗi clearCart: $e');
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
}
