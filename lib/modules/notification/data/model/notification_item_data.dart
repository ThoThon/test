class NotificationItemData {
  final String? id;
  final String? entityId;
  final String? entityType;
  final String? notificationObjectId;
  final String? message;
  final DateTime? createDate;
  final int? status;
  final String? name;
  final String? timeAgo;
  final String? appAction;
  final int? typeOfNotification;
  final String? url;
  final String? notifierId;

  NotificationItemData({
    this.id,
    this.entityId,
    this.entityType,
    this.notificationObjectId,
    this.message,
    this.createDate,
    this.status,
    this.name,
    this.timeAgo,
    this.appAction,
    this.typeOfNotification,
    this.url,
    this.notifierId,
  });

  factory NotificationItemData.fromJson(Map<String, dynamic> json) {
    return NotificationItemData(
      id: json['id'],
      entityId: json['entityId'],
      entityType: json['entityType'],
      notificationObjectId: json['notificationObjectId'],
      message: json['message'],
      createDate: DateTime.tryParse(json['createDate'] ?? ''),
      status: json['status'],
      name: json['name'],
      timeAgo: json['timeAgo'],
      appAction: json['appAction'],
      typeOfNotification: json['typeOfNotification'],
      url: json['url'],
      notifierId: json['notifierId'],
    );
  }
}
