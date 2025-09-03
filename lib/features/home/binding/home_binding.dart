import 'package:get/get.dart';

import '../../mainpage/binding/mainpage_binding.dart';
import '../../profile/controller/profile_controller.dart';
import '../controller/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<ProfileController>(() => ProfileController());

    // Load mainpage binding
    MainpageBinding().dependencies();
  }
}
