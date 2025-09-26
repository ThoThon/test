import 'dart:async';

import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/modules/home_clean/domain/usecase/get_unread_notification_count_use_case.dart';
import 'package:v_bhxh/modules/home_clean/domain/usecase/read_all_notification_use_case.dart';
import 'package:v_bhxh/modules/home_clean/presentation/events/home_event.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';
import 'package:v_bhxh/shares/utils/event_bus_util.dart';

import '../../../../base_app/model/app_data.dart';
import '../../../../clean/core/data/data_source/local/app_hive_impl.dart';
import '../../../../clean/routes/app_routes_cl.dart';
import '../../../src.dart';

class HomeControllerCl extends BaseGetClController {
  /// Biến loading riêng cho thao tác `readAllNotification`
  final isLoadingNotificationCount = false.obs;

  final ReadAllNotificationUseCase _readAllNotificationUseCase;
  final GetUnreadNotificationCountUseCase _getUnreadNotificationCountUseCase;

  StreamSubscription<HomeEvent>? _homeEventSubscription;

  HomeControllerCl(
    this._readAllNotificationUseCase,
    this._getUnreadNotificationCountUseCase,
  );

  void _listenToEvents() {
    _homeEventSubscription ??= eventBus.on<HomeEvent>().listen((event) {
      if (event is GetUnreadNotificationCountEvent) {
        _getUnreadNotificationCount();
      }
    });
  }

  @override
  void onInit() {
    super.onInit();
    _listenToEvents();
  }

  @override
  void onReady() {
    super.onReady();
    _getUnreadNotificationCount();
  }

  @override
  void dispose() {
    _homeEventSubscription?.cancel();
    _homeEventSubscription = null;
    super.dispose();
  }

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

  Future<void> _getUnreadNotificationCount() {
    return buildState(
      action: () async {
        isLoadingNotificationCount.value = true;
        final totalUnread = await _getUnreadNotificationCountUseCase.execute();
        AppData.instance.totalUnread.value = totalUnread;
      },
      onFinally: () {
        isLoadingNotificationCount.value = false;
      },
    );
  }

  Future<void> readAllNotification() async {
    return buildState(
      action: () async {
        isLoadingNotificationCount.value = true;
        await _readAllNotificationUseCase.execute();
        AppData.instance.totalUnread.value = 0;
      },
      onFinally: () {
        isLoadingNotificationCount.value = false;
      },
    );
  }

  void goToNotificationPage() async {
    await nav.toNamed(AppRoutesCl.notification.path);
    readAllNotification();
  }
}
