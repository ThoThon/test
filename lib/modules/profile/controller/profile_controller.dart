import '../../../base_app/base_app.src.dart';
import '../../../modules/src.dart';
import '../../../shares/widgets/dialog/dialog.src.dart';
import '../../login/model/model_src.dart';

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
