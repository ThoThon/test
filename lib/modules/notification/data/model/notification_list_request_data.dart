class NotificationListRequestData {
  final int pageIndex;
  final int pageSize;

  NotificationListRequestData({
    required this.pageIndex,
    required this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    };
  }
}
