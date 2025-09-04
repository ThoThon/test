import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../mainpage_controller.dart';
import 'product_item.dart';

class MainpageScreen extends StatelessWidget {
  const MainpageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainpageController>(
      init: MainpageController(),
      builder: (controller) {
        return Scaffold(
          body: RefreshIndicator(
            onRefresh: controller.refreshProducts,
            color: const Color(0xFFf24e1e),
            child: Obx(() {
              // Loading state cho lần đầu
              if (controller.isLoading.value && controller.products.isEmpty) {
                return const Center(
                  child: CircularProgressIndicator(
                    color: Color(0xFFf24e1e),
                  ),
                );
              }

              // Error state khi không có data
              if (controller.errorMessage.isNotEmpty &&
                  controller.products.isEmpty) {
                return _buildErrorState(controller);
              }

              // Empty state
              if (controller.products.isEmpty) {
                return _buildEmptyState();
              }

              // Product List
              return _buildProductList(controller);
            }),
          ),
        );
      },
    );
  }

  Widget _buildProductList(MainpageController controller) {
    return ListView.builder(
      controller: controller.scrollController,
      physics: const AlwaysScrollableScrollPhysics(),
      padding: const EdgeInsets.only(top: 8, bottom: 20),
      itemCount: controller.products.length + 1, // +1 cho loading indicator
      itemBuilder: (context, index) {
        // Product items
        if (index < controller.products.length) {
          final product = controller.products[index];
          return ProductItem(
            product: product,
            onTap: () {
              // TODO: Navigate to product detail
              print('Tapped product: ${product.name}');
            },
          );
        }

        // Load more indicator ở cuối list
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

          if (!controller.hasMoreData.value) {
            return const Padding(
              padding: EdgeInsets.all(16),
              child: Center(
                child: Text(
                  'Đã hiển thị tất cả sản phẩm',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14,
                  ),
                ),
              ),
            );
          }

          // Empty container khi có thêm data để load
          return const SizedBox(height: 16);
        });
      },
    );
  }

  Widget _buildErrorState(MainpageController controller) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.error_outline,
            size: 64,
            color: Colors.grey,
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
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: () => controller.loadProducts(isRefresh: true),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFf24e1e),
              foregroundColor: Colors.white,
            ),
            child: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 64,
            color: Colors.grey,
          ),
          SizedBox(height: 16),
          Text(
            'Không có sản phẩm nào',
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
