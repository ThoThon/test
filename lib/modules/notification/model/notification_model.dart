import 'package:v_bhxh/modules/notification/model/notification_item_model.dart';

class NotificationModel {
  final List<NotificationItemModel> data;
  final int total;
  final int totalUnread;

  NotificationModel({
    required this.data,
    required this.total,
    required this.totalUnread,
  });

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      data: (json['data'] as List? ?? [])
          .map((item) => NotificationItemModel.fromJson(item))
          .toList(),
      total: json['total'] ?? 0,
      totalUnread: json['totalUnread'] ?? 0,
    );
  }
}
