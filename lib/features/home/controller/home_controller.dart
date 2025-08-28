import 'package:get/get.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }
}
