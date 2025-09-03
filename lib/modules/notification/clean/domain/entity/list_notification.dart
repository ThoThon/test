import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/notification/clean/domain/entity/notification.dart';

class ListNotification implements Entity {
  final List<Notification> data;
  final int total;
  final int totalUnread;

  ListNotification({
    required this.data,
    required this.total,
    required this.totalUnread,
  });
}
