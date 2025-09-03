import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class Notification implements Entity {
  final String id;
  final String entityId;
  final String entityType;
  final String notificationObjectId;
  final String message;
  final DateTime createDate;
  final int status;
  final String name;
  final String timeAgo;
  final String appAction;
  final int typeOfNotification;
  final String url;
  final String notifierId;

  Notification({
    required this.id,
    required this.entityId,
    required this.entityType,
    required this.notificationObjectId,
    required this.message,
    required this.createDate,
    required this.status,
    required this.name,
    required this.timeAgo,
    required this.appAction,
    required this.typeOfNotification,
    required this.url,
    required this.notifierId,
  });
}
