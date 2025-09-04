import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/modules/home_clean/domain/usecase/read_all_notification_use_case.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';

import '../../../../base_app/model/app_data.dart';
import '../../../../clean/core/data/data_source/local/app_hive_impl.dart';
import '../../../../clean/routes/app_routes_cl.dart';
import '../../../src.dart';

class HomeControllerCl extends BaseGetClController {
  /// Biến loading riêng cho thao tác `readAllNotification`
  final isReadingAllNoti = false.obs;

  final ReadAllNotificationUseCase _readAllNotificationUseCase;

  HomeControllerCl(this._readAllNotificationUseCase);

  void showDialogLogout() {
    nav.showConfirmDialog(
      title: LocaleKeys.dialog_isLogout.tr,
      onConfirm: () async {
        await AppHiveImpl.instance.deleteKeys([
          HiveKeys.keyJwtToken,
          HiveKeys.keyUsername,
        ]);
        nav.offAllNamed(AppRoutesCl.login.path);
      },
      cancelTitle: LocaleKeys.dialog_cancel.tr,
      confirmTitle: LocaleKeys.dialog_confirm.tr,
    );
  }

  void goToGuideViewPdf() {
    nav.toNamed(
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
    return buildState(
      action: () async {
        isReadingAllNoti.value = true;
        await _readAllNotificationUseCase.execute();
        AppData.instance.totalUnread.value = 0;
      },
      onFinally: () {
        isReadingAllNoti.value = false;
      },
    );
  }

  void goToNotificationPage() {
    if (!isReadingAllNoti.value) {
      nav.toNamed(AppRoutesCl.notification.path)?.whenComplete(
            () => readAllNotification(),
          );
    }
  }
}
