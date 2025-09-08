import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../notification_src.dart';

class GetListNotificationUseCase
    extends UseCase<NotificationListRequest, NotificationList> {
  final NotificationRepository _notificationRepository;

  GetListNotificationUseCase(this._notificationRepository);

  @override
  Future<NotificationList> execute(NotificationListRequest input) {
    return _notificationRepository.getListNotification(
      request: input,
    );
  }
}
