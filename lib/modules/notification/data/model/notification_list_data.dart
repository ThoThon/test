import 'notification_item_data.dart';

class NotificationListData {
  final List<NotificationItemData>? data;
  final int? total;
  final int? totalUnread;

  NotificationListData({
    this.data,
    this.total,
    this.totalUnread,
  });

  factory NotificationListData.fromJson(Map<String, dynamic> json) {
    return NotificationListData(
      data: json['data'] != null
          ? (json['data'] as List<dynamic>)
              .map((e) => NotificationItemData.fromJson(e))
              .toList()
          : [],
      total: json['total'],
      totalUnread: json['totalUnread'],
    );
  }
}
