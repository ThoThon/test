import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/mainpage_controller.dart';
import '../widget/product_card.dart';

class MainpageScreen extends GetView<MainpageController> {
  const MainpageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Obx(() {
        if (controller.products.isEmpty && controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.products.isEmpty && !controller.isLoading.value) {
          return const Center(
            child: Text(
              "Không có sản phẩm nào",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () => controller.fetchProducts(refresh: true),
          child: GridView.builder(
            padding: const EdgeInsets.all(12),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.8,
            ),
            itemCount:
                controller.products.length + (controller.hasMore.value ? 1 : 0),
            itemBuilder: (context, index) {
              if (index < controller.products.length) {
                return ProductCard(product: controller.products[index]);
              } else {
                WidgetsBinding.instance.addPostFrameCallback((_) {
                  controller.loadMore();
                });

                return Center(
                  child: controller.isLoading.value
                      ? const CircularProgressIndicator()
                      : const SizedBox.shrink(),
                );
              }
            },
          ),
        );
      }),
    );
  }
}
