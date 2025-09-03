import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/notification/clean/domain/repository/notification_repository.dart';

class DeleteListNotificationUseCase extends UseCase<List<String>, bool> {
  final NotificationRepository _notificationRepository;

  DeleteListNotificationUseCase(this._notificationRepository);

  @override
  Future<bool> execute(List<String> input) {
    return _notificationRepository.deleteListNotification(id: input);
  }
}
