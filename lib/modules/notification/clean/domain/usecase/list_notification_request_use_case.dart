import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/notification/clean/domain/entity/list_notification.dart';
import 'package:v_bhxh/modules/notification/clean/domain/repository/notification_repository.dart';

import '../entity/list_notification_request.dart';

class ListNotificationRequestUseCase
    extends UseCase<ListNotificationRequest, ListNotification> {
  final NotificationRepository _notificationRepository;

  ListNotificationRequestUseCase(this._notificationRepository);

  @override
  Future<ListNotification> execute(ListNotificationRequest input) {
    return _notificationRepository.getListNotification(
      request: input,
    );
  }
}
