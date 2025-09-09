import 'package:get/get.dart';

import '../../../repositories/auth_repository.dart';
import '../../../routes/app_routes.dart';

class ProfileController extends GetxController {
  final RxString userName = ''.obs;
  final RxString userTaxCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  void loadUserInfo() {
    final loginInfo = AuthRepository.savedLoginInfo;
    if (loginInfo != null) {
      userName.value = loginInfo.username;
      userTaxCode.value = loginInfo.taxCode;
    }
  }

  Future<void> logout() async {
    await AuthRepository.logout();
    Get.offAllNamed(Routes.login);
  }
}
