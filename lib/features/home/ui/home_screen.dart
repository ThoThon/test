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
      MainpageScreen(),
      ProfileScreen(),
    ];
    return Obx(
      () {
        return Scaffold(
          appBar: AppBar(
            title: const Text("Trang chủ"),
          ),
          body: IndexedStack(
            index: controller.currentIndex.value,
            children: screens,
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: controller.currentIndex.value,
            onTap: controller.changeTab,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person), label: "Profile"),
            ],
          ),
        );
      },
    );
  }
}
