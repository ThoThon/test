import 'package:get/get.dart';

import '../modules/home/binding/home_binding.dart';
import '../modules/home/ui/home_screen.dart';
import '../modules/login/binding/login_binding.dart';
import '../modules/login/ui/login_screen.dart';
import 'app_routes.dart';

class AppPages {
  static List<GetPage> routes = [
    GetPage(
      name: Routes.login,
      page: () => const LoginScreen(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: Routes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
  ];
}
