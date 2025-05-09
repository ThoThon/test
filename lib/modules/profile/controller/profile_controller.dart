import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../login/model/model_src.dart';
import '../../src.dart';

class ProfileController extends BaseGetxController {
  final appController = Get.find<AppController>();

  AccountInfoModel? accountInfo;
  @override
  void onInit() {
    super.onInit();
    accountInfo = appController.accountInfoModel;
  }

  void showDialogLogout() {
    ShowDialog.showDialogConfirm(
      title: LocaleKeys.dialog_isLogout.tr,
      textBtnRight: LocaleKeys.dialog_logout.tr,
      status: LocaleKeys.dialog_logout.tr,
      onPressed: () {
        appController.logout();
      },
      activeIcon: false,
    );
  }
}
