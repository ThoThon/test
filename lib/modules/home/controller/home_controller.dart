import '../../../base_app/base_app.src.dart';
import '../../../shares/widgets/dialog/dialog_utils.dart';
import '../../login/model/model_src.dart';
import '../../src.dart';
import '../../view_pdf/model/view_pdf_argument.dart';

class HomeController extends BaseGetxController {
  final _appController = Get.find<AppController>();

  void showDialogLogout() {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_isLogout.tr,
      onConfirm: () {
        _appController.logout();
      },
      backgroundColorBack: AppColors.basicWhite,
      confirmTitle: LocaleKeys.dialog_confirm.tr,
      exitTitle: LocaleKeys.dialog_cancel.tr,
      textStyleBack:
          AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
    );
  }

  void goToGuideViewPdf() {
    Get.toNamed(
      AppRoutes.viewPdf.path,
      arguments: ViewPdfArgument(
        url: 'https://vbhxh-mobile-api.easyhrm.vn/user_guide.pdf',
        title: LocaleKeys.home_guide.tr,
        isRotateHorizontal: false,
        enableDownloadButton: false,
      ),
    );
  }
}
