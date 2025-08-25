import 'package:get/get.dart';

import '../../login/models/login/login_storage.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    super.onInit();
  }

  var currentIndex = 0.obs;

  void changeTab(int index) {
    currentIndex.value = index;
  }

  Future<void> logout() async {
    await LoginStorage.clearLoginInfo();
  }
}
