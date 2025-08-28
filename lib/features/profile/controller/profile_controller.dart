import 'package:get/get.dart';

import '../../../routes/app_routes.dart';
import '../../login/models/login/login_storage.dart';

class ProfileController extends GetxController {
  final RxString userName = ''.obs;
  final RxString userTaxCode = ''.obs;

  @override
  void onInit() {
    super.onInit();
    loadUserInfo();
  }

  void loadUserInfo() {
    final loginInfo = LoginStorage.getLoginInfo();
    if (loginInfo != null) {
      userName.value = loginInfo.username;
      userTaxCode.value = loginInfo.taxCode;
    }
  }

  Future<void> logout() async {
    await LoginStorage.clearLoginInfo();
    Get.offAllNamed(Routes.login);
  }
}
