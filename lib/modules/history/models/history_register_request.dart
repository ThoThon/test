class HistoryRegisterRequest {
  final int pageIndex;
  final int pageSize;
  final int thang;
  final int nam;

  HistoryRegisterRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.thang,
    required this.nam,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'thang': thang,
      'nam': nam,
    };
  }
}
