import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../home/controller/home_controller.dart';

class MainpageScreen extends GetView<HomeController> {
  const MainpageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "API Data Screen",
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}
