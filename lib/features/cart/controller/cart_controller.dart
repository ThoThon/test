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

  Future<void> addToCart(Product product) async {
    final cartItem = CartItem(
      productId: product.id,
      name: product.name,
      price: product.price,
      cover: product.cover,
    );
    await CartStorage.addToCart(cartItem);
    loadCartItems();
  }

  Future<void> removeFromCart(int productId) async {
    await CartStorage.removeFromCart(productId);
    loadCartItems();
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
      await CartStorage.clearCart();
      loadCartItems();
    }
  }

  void _updateTotals() {
    totalItems.value = CartStorage.itemCount;
    totalPrice.value = CartStorage.totalPrice;
  }

  bool isInCart(int productId) {
    return CartStorage.isInCart(productId);
  }

  CartItem? getCartItem(int productId) {
    return CartStorage.getCartItem(productId);
  }
}
