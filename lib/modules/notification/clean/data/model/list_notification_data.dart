import 'notification_data.dart';

class ListNotificationData {
  final List<NotificationData>? data;
  final int? total;
  final int? totalUnread;

  ListNotificationData({
    this.data,
    this.total,
    this.totalUnread,
  });

  factory ListNotificationData.fromJson(Map<String, dynamic> json) {
    return ListNotificationData(
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
              .map((e) => NotificationData.fromJson(e))
              .toList()
          : [],
      total: json['total'],
      totalUnread: json['totalUnread'],
    );
  }
}
