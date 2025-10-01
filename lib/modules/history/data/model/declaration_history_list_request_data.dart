class DeclarationHistoryListRequestData {
  final String? companyId;
  final int? pageIndex;
  final int? pageSize;
  final String? thang;
  final String? nam;
  final String? maThuTuc;
  final String? soHoSo;

  DeclarationHistoryListRequestData({
    this.companyId,
    this.pageIndex,
    this.pageSize,
    this.thang,
    this.nam,
    this.maThuTuc,
    this.soHoSo,
  });

  Map<String, dynamic> toJson() {
    return {
      'companyId': companyId,
      'pageIndex': pageIndex,
      'pageSize': pageSize,
      'thang': thang,
      'nam': nam,
      'maThuTuc': maThuTuc,
      'soHoSo': soHoSo,
    };
  }
}
