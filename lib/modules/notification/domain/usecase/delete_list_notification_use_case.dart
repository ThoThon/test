import 'dart:async';

import '../../../../clean/core/domain/usecase/base_use_case.dart';
import '../../notification_src.dart';

class DeleteListNotificationUseCase extends UseCase<List<String>, bool> {
  final NotificationRepository _notificationRepository;

  DeleteListNotificationUseCase(this._notificationRepository);

  @override
  Future<bool> execute(List<String> input) {
    return _notificationRepository.deleteListNotification(ids: input);
  }
}
