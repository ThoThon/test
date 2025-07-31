import 'package:v_bhxh/clean/core/data/data_source/local/app_hive_impl.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';

import '../../../base_app/base_app.src.dart';
import '../../../shares/widgets/dialog/dialog_utils.dart';
import '../../src.dart';
import '../../view_pdf/model/view_pdf_argument.dart';

class HomeController extends BaseGetxController {
  void showDialogLogout() {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_isLogout.tr,
      onConfirm: () async {
        await AppHiveImpl.instance.deleteKeys([
          HiveKeys.keyJwtToken,
          HiveKeys.keyUsername,
        ]);
        Get.offAllNamed(AppRoutesCl.login.path);
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
      AppRoutesCl.viewPdf.path,
      arguments: ViewPdfArgument(
        url: 'https://vbhxh-mobile-api.easyhrm.vn/user_guide.pdf',
        title: LocaleKeys.home_guide.tr,
        isRotateHorizontal: false,
        enableDownloadButton: false,
      ),
    );
  }
}
