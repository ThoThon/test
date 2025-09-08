import 'package:v_bhxh/clean/core/presentation/bindings/base_bindings.dart';
import 'package:v_bhxh/clean/shared/utils/get_finder.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../notification_src.dart';

class NotificationBinding extends BaseBindings {
  @override
  void bindingsController() {
    Get.lazyPut(
      () => NotificationController(
        sl(),
        sl(),
      ),
    );
  }

  @override
  void bindingsRepository() {
    Get.lazyPut<NotificationRepository>(
      () => NotificationRepositoryImpl(sl(), sl(), sl()),
    );
  }

  @override
  void bindingsUseCase() {
    Get.lazyPut(() => GetListNotificationUseCase(sl()));
    Get.lazyPut(() => DeleteListNotificationUseCase(sl()));
  }
}
