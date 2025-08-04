import 'package:v_bhxh/clean/core/data/data_source/local/app_hive_impl.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/home/repository/home_repository.dart';

import '../../../base_app/base_app.src.dart';
import '../../../shares/widgets/dialog/dialog_utils.dart';
import '../../src.dart';
import '../../view_pdf/model/view_pdf_argument.dart';

class HomeController extends BaseGetxController {
  late final _repository = HomeRepository(this);

  /// Biến loading riêng cho thao tác `readAllNotification`
  final isReadingAllNoti = false.obs;

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

  Future<void> readAllNotification() async {
    try {
      isReadingAllNoti.value = true;
      final res = await _repository.readAllNotification();
      if (res.isSuccess) {
        AppData.instance.totalUnread.value = 0;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      isReadingAllNoti.value = false;
    }
  }

  void goToNotificationPage() {
    if (!isReadingAllNoti.value) {
      Get.toNamed(AppRoutesCl.notification.path)?.whenComplete(
        () => readAllNotification(),
      );
    }
  }
}
