import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/theme/colors.dart';
import 'package:v_bhxh/modules/home/ui/home_page.dart';
import 'package:v_bhxh/modules/notification/ui/notification_page.dart';
import 'package:v_bhxh/modules/profile/ui/profile_page.dart';

import 'page_builder_controller.dart';

class PageBuilder extends BaseGetWidget<PageBuilderController> {
  PageBuilder({super.key});

  @override
  PageBuilderController get controller => _controller;

  late final _controller = Get.put(PageBuilderController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: AppBar(toolbarHeight: 0),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  //Thêm PageStorageKey vào key của page để lưu trạng thái page hiện tại
  Widget _buildBody() {
    return PageView(
      controller: controller.pageController,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      onPageChanged: controller.changePage,
      children: [
        HomePage(),
        Center(child: Text("Danh sách")),
        NotificationPage(),
        ProfilePage(),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Obx(
      () {
        return BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          unselectedItemColor: Color(0xFF196DFF),
          currentIndex: controller.pageIndex.value,
          backgroundColor: Colors.white,
          selectedItemColor: AppColors.primaryColor,
          onTap: controller.changePage,
          items: _navBarsItems(),
        );
      },
    );
  }

  BottomNavigationBarItem _buildItem({
    required int index,
    required IconData icon,
    required String label,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon),
      label: label,
    );
  }

  List<BottomNavigationBarItem> _navBarsItems() {
    return [
      _buildItem(
        index: 0,
        icon: Icons.home,
        label: 'Trang chủ',
      ),
      _buildItem(
        index: 1,
        icon: Icons.bar_chart,
        label: 'Báo cáo',
      ),
      _buildItem(
        index: 2,
        icon: Icons.notifications,
        label: 'Thông báo',
      ),
      _buildItem(
        index: 3,
        icon: Icons.person,
        label: 'Tài khoản',
      ),
    ];
  }
}
