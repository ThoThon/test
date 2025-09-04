import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../../notification_src.dart';

abstract class NotificationRepository extends BaseRepositoryCl {
  Future<NotificationList> getListNotification({
    required NotificationListRequest request,
  });

  // Xóa list thông báo
  Future<bool> deleteListNotification({
    required List<String> id,
  });
}
