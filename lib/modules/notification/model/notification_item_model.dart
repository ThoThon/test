class NotificationItemModel {
  final String id;
  final String entityId;
  final String entityType;
  final String notificationObjectId;
  final String message;
  final DateTime createDate;
  int status;
  final String name;
  final String timeAgo;
  final String appAction;
  final int typeOfNotification;
  final String url;
  final String notifierId;

  NotificationItemModel({
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

  factory NotificationItemModel.fromJson(Map<String, dynamic> json) {
    return NotificationItemModel(
      id: json['id'] ?? '',
      entityId: json['entityId'] ?? '',
      entityType: json['entityType'] ?? '',
      notificationObjectId: json['notificationObjectId'] ?? '',
      message: json['message'] ?? '',
      createDate: DateTime.tryParse(json['createDate'] ?? '') ?? DateTime(2000),
      status: json['status'] ?? 0,
      name: json['name'] ?? '',
      timeAgo: json['timeAgo'] ?? '',
      appAction: json['appAction'] ?? '',
      typeOfNotification: json['typeOfNotification'] ?? 0,
      url: json['url'] ?? '',
      notifierId: json['notifierId'] ?? '',
    );
  }
}
