import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cart_controller.dart';
import '../widget/cart_item_card.dart';

class CartScreen extends GetView<CartController> {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: const Text("Giỏ hàng",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        actions: [
          Obx(() => controller.cartItems.isEmpty
              ? const SizedBox.shrink()
              : TextButton(
                  onPressed: controller.clearCart,
                  child: const Text("Xóa tất cả",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.w600)),
                )),
        ],
      ),
      body: Obx(() => controller.cartItems.isEmpty
          ? _buildEmptyCart()
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: controller.cartItems.length,
                    itemBuilder: (context, index) => CartItemCard(
                      cartItem: controller.cartItems[index],
                      key: ValueKey(controller.cartItems[index].productId),
                    ),
                  ),
                ),
                _buildCartSummary(),
              ],
            )),
    );
  }

  Widget _buildEmptyCart() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.shopping_cart_outlined,
              size: 100, color: Colors.grey[400]),
          const SizedBox(height: 16),
          Text("Giỏ hàng trống",
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey[600])),
          const SizedBox(height: 8),
          Text("Hãy thêm sản phẩm vào giỏ hàng",
              style: TextStyle(fontSize: 14, color: Colors.grey[500]),
              textAlign: TextAlign.center),
          const SizedBox(height: 32),
          ElevatedButton.icon(
            onPressed: () => Get.back(),
            icon: const Icon(Icons.shopping_bag, color: Colors.white),
            label: const Text("Tiếp tục mua sắm",
                style: TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w600)),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFf24e1e),
              padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildCartSummary() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
              color: Colors.black12, offset: Offset(0, -2), blurRadius: 10)
        ],
      ),
      child: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tổng số lượng:",
                    style:
                        TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
                Obx(() => Text("${controller.totalItems.value} sản phẩm",
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFf24e1e)))),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text("Tổng tiền:",
                    style:
                        TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                Obx(() => Text("${controller.totalPrice.value} VNĐ",
                    style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFf24e1e)))),
              ],
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              height: 56,
              child: ElevatedButton(
                onPressed: () => Get.snackbar(
                    "Thông báo", "Tính năng thanh toán chưa được cập nhật",
                    backgroundColor: Colors.blue, colorText: Colors.white),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFf24e1e),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: const Text("Thanh toán",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
