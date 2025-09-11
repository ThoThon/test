// lib/features/mainpage/ui/mainpage_screen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../controller/mainpage_controller.dart';
import '../widget/product_card.dart';

class MainpageScreen extends GetView<MainpageController> {
  const MainpageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Obx(() {
        // Hiển thị loading khi lần đầu tải
        if (controller.products.isEmpty && controller.isLoading.value) {
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xFFf24e1e),
            ),
          );
        }

        // Hiển thị message khi không có sản phẩm
        if (controller.products.isEmpty && !controller.isLoading.value) {
          return _buildEmptyState();
        }

        // Hiển thị danh sách sản phẩm với SmartRefresher
        return SmartRefresher(
          controller: controller.refreshController,
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoadMore,
          header: _buildRefreshHeader(),
          footer: _buildLoadMoreFooter(),
          child: _buildProductGrid(),
        );
      }),
    );
  }

  /// Widget hiển thị khi danh sách trống
  Widget _buildEmptyState() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.inventory_2_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          const SizedBox(height: 16),
          Text(
            "Chưa có sản phẩm nào",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Kéo xuống để làm mới",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[500],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => controller.onRefresh(),
            icon: const Icon(Icons.refresh, color: Colors.white),
            label: const Text(
              "Làm mới",
              style: TextStyle(color: Colors.white),
            ),
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFFf24e1e),
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// Header cho pull to refresh
  Widget _buildRefreshHeader() {
    return const WaterDropHeader(
      waterDropColor: Color(0xFFf24e1e),
      complete: Icon(
        Icons.done,
        color: Color(0xFFf24e1e),
      ),
    );
  }

  /// Footer cho load more
  Widget _buildLoadMoreFooter() {
    return CustomFooter(
      builder: (BuildContext context, LoadStatus? mode) {
        Widget body;

        switch (mode) {
          case LoadStatus.idle:
            body = const Text(
              "Kéo lên để tải thêm",
              style: TextStyle(color: Colors.grey),
            );
            break;
          case LoadStatus.loading:
            body = const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    color: Color(0xFFf24e1e),
                    strokeWidth: 2,
                  ),
                ),
                SizedBox(width: 8),
                Text(
                  "Đang tải...",
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            );
            break;
          case LoadStatus.failed:
            body = const Text(
              "Tải thất bại! Nhấn để thử lại",
              style: TextStyle(color: Colors.red),
            );
            break;
          case LoadStatus.canLoading:
            body = const Text(
              "Thả để tải thêm",
              style: TextStyle(color: Color(0xFFf24e1e)),
            );
            break;
          case LoadStatus.noMore:
            body = Container(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.check_circle, color: Colors.grey, size: 16),
                  SizedBox(width: 4),
                  Text(
                    "Đã hiển thị tất cả sản phẩm",
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            );
            break;
          default:
            body = const Text("");
            break;
        }

        return Container(
          height: 55.0,
          child: Center(child: body),
        );
      },
    );
  }

  /// Widget hiển thị grid sản phẩm
  Widget _buildProductGrid() {
    return GridView.builder(
      padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 0.8,
      ),
      itemCount: controller.products.length,
      itemBuilder: (context, index) {
        final product = controller.products[index];
        return ProductCard(
          product: product,
          key: ValueKey(product.id),
        );
      },
    );
  }
}
