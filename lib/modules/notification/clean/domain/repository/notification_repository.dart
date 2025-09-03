import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/notification/clean/domain/entity/list_notification.dart';

import '../entity/list_notification_request.dart';

abstract class NotificationRepository extends BaseRepositoryCl {
  Future<ListNotification> getListNotification({
    required ListNotificationRequest request,
  });

  // Xóa list thông báo
  Future<bool> deleteListNotification({
    required List<String> id,
  });
}
