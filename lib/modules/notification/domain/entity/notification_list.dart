import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'notification_item.dart';

class NotificationList implements Entity {
  final List<NotificationItem> data;
  final int total;
  final int totalUnread;

  NotificationList({
    required this.data,
    required this.total,
    required this.totalUnread,
  });
}
