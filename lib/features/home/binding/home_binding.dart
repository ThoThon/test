import 'package:get/get.dart';

import '../../mainpage/controller/mainpage_controller.dart';
import '../../profile/controller/profile_controller.dart';
import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());
    Get.lazyPut<MainpageController>(() => MainpageController());
  }
}
