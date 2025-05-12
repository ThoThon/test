class HistoryRequest {
  final int pageIndex;
  final int pageSize;
  final String? thang;
  final String? nam;
  final String? maThuTuc;
  final String? soHoSo;

  HistoryRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.thang,
    required this.nam,
    required this.maThuTuc,
    this.soHoSo,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'thang': thang ?? "",
      'nam': nam ?? "",
      'maThuTuc': maThuTuc ?? "",
      'soHoSo': soHoSo ?? "",
    };
  }
}
