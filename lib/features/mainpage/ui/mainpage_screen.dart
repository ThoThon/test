import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mainpage_controller.dart';

class MainPageScreen extends GetView<MainPageController> {
  const MainPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách sản phẩm")),
      body: Obx(() {
        // Trạng thái đang loading + chưa có dữ liệu gì
        if (controller.isLoading.value && controller.products.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        // Debug: nếu danh sách trống
        if (controller.products.isEmpty) {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return const Center(child: Text("Không có sản phẩm"));
          }
        }

        // Nếu có dữ liệu thì build list
        return RefreshIndicator(
          onRefresh: controller.refreshProducts,
          child: ListView.builder(
            itemCount: controller.products.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.products.length) {
                final product = controller.products[index];
                return ListTile(
                  leading: Image.network(product.cover, width: 50, height: 50),
                  title: Text(product.name),
                  subtitle:
                      Text("Giá: ${product.price} - SL: ${product.quantity}"),
                );
              } else {
                if (controller.hasMore.value) {
                  controller.fetchProducts(loadMore: true);
                  return const Padding(
                    padding: EdgeInsets.all(16),
                    child: Center(child: CircularProgressIndicator()),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              }
            },
          ),
        );
      }),
    );
  }
}
