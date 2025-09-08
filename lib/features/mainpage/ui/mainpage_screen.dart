import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'mainpage_controller.dart';

class MainpageScreen extends GetView<MainpageController> {
  const MainpageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Gọi fetchProducts lần đầu
    controller.fetchProducts();

    return Scaffold(
      appBar: AppBar(title: const Text("Danh sách sản phẩm")),
      body: Obx(() {
        if (controller.products.isEmpty && controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchProducts(refresh: true),
          child: ListView.builder(
            itemCount: controller.products.length + 1,
            itemBuilder: (context, index) {
              if (index < controller.products.length) {
                final product = controller.products[index];
                return ListTile(
                  leading: Image.network(
                    product.cover,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.name),
                  subtitle:
                      Text("Giá: ${product.price} - SL: ${product.quantity}"),
                );
              } else {
                // Load more
                if (!controller.isLoading.value) {
                  controller.fetchProducts();
                }
                return const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Center(child: CircularProgressIndicator()),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
