import 'package:v_bhxh/modules/notification/model/notification_item_model.dart';

class NotificationResponse {
  final List<NotificationItemModel> data;
  final int total;
  final int totalUnread;

  NotificationResponse({
    required this.data,
    required this.total,
    required this.totalUnread,
  });

  factory NotificationResponse.fromJson(Map<String, dynamic> json) {
    return NotificationResponse(
      data: (json['data'] as List? ?? [])
          .map((item) => NotificationItemModel.fromJson(item))
          .toList(),
      total: json['total'] ?? 0,
      totalUnread: json['totalUnread'] ?? 0,
    );
  }
}
