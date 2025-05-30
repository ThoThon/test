class NotificationRequest {
  final int pageIndex;
  final int pageSize;

  NotificationRequest({
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
