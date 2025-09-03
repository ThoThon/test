class ListNotificationRequestData {
  final int? pageIndex;
  final int? pageSize;

  ListNotificationRequestData({
    this.pageIndex,
    this.pageSize,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
    };
  }
}
