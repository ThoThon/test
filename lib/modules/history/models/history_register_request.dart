class HistoryRegisterRequest {
  final int pageIndex;
  final int pageSize;
  final int thang;
  final int nam;
  final String soHoSo;
  final String loaiGiaoDich;

  const HistoryRegisterRequest({
    required this.pageIndex,
    required this.pageSize,
    required this.thang,
    required this.nam,
    required this.soHoSo,
    required this.loaiGiaoDich,
  });

  Map<String, dynamic> toJson() {
    return {
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'thang': thang,
      'nam': nam,
      'soHoSo': soHoSo,
      'loaiGiaoDich': loaiGiaoDich,
    };
  }
}
