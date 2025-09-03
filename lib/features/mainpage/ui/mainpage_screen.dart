import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/maipage_controller.dart';
import 'widgets/product_card.dart';

class MainpageScreen extends GetView<MainpageController> {
  const MainpageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.isLoading.value && controller.products.isEmpty) {
          return _buildLoadingState();
        }

        if (controller.errorMessage.value.isNotEmpty &&
            controller.products.isEmpty) {
          return _buildErrorState();
        }

        if (controller.products.isEmpty && !controller.isLoading.value) {
          return _buildEmptyState();
        }

        return _buildProductList();
      }),
    );
  }

  Widget _buildLoadingState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(
            color: Color(0xFFf24e1e),
          ),
          SizedBox(height: 16),
          Text(
            'Đang tải danh sách sản phẩm...',
            style: TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.error_outline,
              size: 64,
              color: Colors.red,
            ),
            const SizedBox(height: 16),
            Text(
              controller.errorMessage.value,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: controller.retry,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFFf24e1e),
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              ),
              child: const Text('Thử lại'),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            'Không có sản phẩm nào',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          TextButton(
            onPressed: controller.retry,
            child: const Text(
              'Tải lại',
              style: TextStyle(color: Color(0xFFf24e1e)),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductList() {
    return RefreshIndicator(
      color: const Color(0xFFf24e1e),
      onRefresh: controller.onRefresh,
      child: ListView.builder(
        controller: controller.scrollController,
        physics: const AlwaysScrollableScrollPhysics(),
        itemCount:
            controller.products.length + (controller.hasMore.value ? 1 : 0),
        itemBuilder: (context, index) {
          if (index < controller.products.length) {
            final product = controller.products[index];
            return ProductCard(
              product: product,
              onTap: () {
                // Handle product tap (navigate to detail, etc.)
                Get.snackbar(
                  'Sản phẩm',
                  'Bạn đã chọn: ${product.name}',
                  backgroundColor: const Color(0xFFf24e1e).withOpacity(0.8),
                  colorText: Colors.white,
                  duration: const Duration(seconds: 1),
                );
              },
            );
          } else {
            return _buildLoadMoreIndicator();
          }
        },
      ),
    );
  }

  Widget _buildLoadMoreIndicator() {
    return Obx(() {
      if (controller.isLoadingMore.value) {
        return const Padding(
          padding: EdgeInsets.all(16),
          child: Center(
            child: CircularProgressIndicator(
              color: Color(0xFFf24e1e),
            ),
          ),
        );
      }
      return const SizedBox.shrink();
    });
  }
}
