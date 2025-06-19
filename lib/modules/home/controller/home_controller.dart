import '../../../base_app/base_app.src.dart';
import '../../../shares/widgets/dialog/dialog_utils.dart';
import '../../login/model/model_src.dart';
import '../../src.dart';
import '../../view_pdf/model/view_pdf_argument.dart';

class HomeController extends BaseGetxController {
  AccountInfoModel? accountInfo;

  final _appController = Get.find<AppController>();

  @override
  void onInit() async {
    super.onInit();
    if (AppData.instance.accountInfoModel.value != null) {
      accountInfo = AppData.instance.accountInfoModel.value;
    }
  }

  void showDialogLogout() {
    ShowDialog.showDialogConfirm(
      title: LocaleKeys.dialog_isLogout.tr,
      textBthLeft: LocaleKeys.dialog_cancel.tr,
      textBtnRight: LocaleKeys.dialog_confirm.tr,
      status: LocaleKeys.dialog_logout.tr,
      onPressed: () {
        _appController.logout();
      },
      activeIcon: false,
    );
  }

  void goToGuideViewPdf(){
    Get.toNamed(
      AppRoutes.viewPdf.path,
      arguments: ViewPdfArgument(
        url: 'https://vbhxh-mobile-api.easyhrm.vn/user_guide.pdf',
        title: LocaleKeys.home_guide.tr,
        isRotateHorizontal: false,
      ),
    );
  }
}
