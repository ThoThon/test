import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../mainpage/ui/mainpage_screen.dart';
import '../../profile/ui/profile_screen.dart';
import '../controller/home_controller.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screens = [
      const MainpageScreen(),
      const ProfileScreen(),
    ];
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              _getAppBarTitle(controller.currentIndex.value),
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            currentIndex: controller.currentIndex.value,
            onTap: (index) {
              controller.changeTab(index);
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
            selectedItemColor: const Color(0xFFf24e1e),
            unselectedItemColor: Colors.black45,
            iconSize: 28,
            selectedLabelStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            unselectedLabelStyle: const TextStyle(
              fontSize: 14,
              color: Colors.black45,
            ),
          ),
        );
      },
    );
  }

  String _getAppBarTitle(int index) {
    switch (index) {
      case 0:
        return "Trang chủ";
      case 1:
        return "Thông tin cá nhân";
      default:
        return "Trang chủ";
    }
  }
}
