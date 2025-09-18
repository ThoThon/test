import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../cart/controller/cart_controller.dart';
import '../models/product_model.dart';

class ProductCard extends StatelessWidget {
  final Product product;
  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final cartController = Get.find<CartController>();

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 3,
      clipBehavior: Clip.antiAlias,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: InkWell(
              onTap: () {
                Get.toNamed(
                  Routes.productDetail,
                  arguments: {'productId': product.id},
                );
              },
              child: Image.network(
                product.cover,
                width: double.infinity,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image_not_supported),
                  );
                },
              ),
            ),
          ),

          // Thông tin sản phẩm
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Tên sản phẩm
                Text(
                  product.name,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.bodyMedium?.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 6),

                // Giá và số lượng
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Text(
                        "${product.price} VNĐ",
                        style: theme.textTheme.titleMedium?.copyWith(
                          color: const Color(0xFFf24e1e),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      "SL: ${product.quantity}",
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: Colors.grey[600],
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 8),

                // Button thêm vào giỏ hàng
                SizedBox(
                  width: double.infinity,
                  height: 32,
                  child: Obx(() {
                    final isInCart = cartController.isInCart(product.id);

                    return ElevatedButton.icon(
                      onPressed: product.quantity > 0
                          ? () {
                              if (isInCart) {
                                // Nếu đã có trong giỏ, mở giỏ hàng
                                Get.toNamed(Routes.cart);
                              } else {
                                // Nếu chưa có, thêm vào giỏ
                                cartController.addToCart(product);
                              }
                            }
                          : null,
                      icon: Icon(
                        isInCart
                            ? Icons.shopping_cart
                            : Icons.add_shopping_cart,
                        size: 16,
                        color: Colors.white,
                      ),
                      label: Text(
                        isInCart ? "Trong giỏ" : "Thêm vào giỏ",
                        style: const TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: product.quantity > 0
                            ? (isInCart
                                ? Colors.green
                                : const Color(0xFFf24e1e))
                            : Colors.grey,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                      ),
                    );
                  }),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
