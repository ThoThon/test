class DeclarationHistoryItemData {
  final String? id;
  final String? maThuTuc;
  final String? thoiGianGui;
  final String? soHoSo;
  final String? thang;
  final String? nam;
  final String? trangThai;
  final bool? trangThaiBuoc1;
  final String? ketQuaBuoc1;
  final bool? trangThaiBuoc2;
  final String? ketQuaBuoc2;
  final bool? trangThaiBuoc3;
  final String? ketQuaBuoc3;
  final bool? trangThaiBuoc4;
  final String? ketQuaBuoc4;

  DeclarationHistoryItemData({
    this.id,
    this.maThuTuc,
    this.thoiGianGui,
    this.soHoSo,
    this.thang,
    this.nam,
    this.trangThai,
    this.trangThaiBuoc1,
    this.ketQuaBuoc1,
    this.trangThaiBuoc2,
    this.ketQuaBuoc2,
    this.trangThaiBuoc3,
    this.ketQuaBuoc3,
    this.trangThaiBuoc4,
    this.ketQuaBuoc4,
  });

  factory DeclarationHistoryItemData.fromJson(Map<String, dynamic> json) {
    return DeclarationHistoryItemData(
      id: json['id'],
      maThuTuc: json['maThuTuc'],
      thoiGianGui: json['thoiGianGui'],
      soHoSo: json['soHoSo'],
      thang: json['thang'],
      nam: json['nam'],
      trangThai: json['trangThai'],
      trangThaiBuoc1: json['trangThaiBuoc1'],
      ketQuaBuoc1: json['ketQuaBuoc1'],
      trangThaiBuoc2: json['trangThaiBuoc2'],
      ketQuaBuoc2: json['ketQuaBuoc2'],
      trangThaiBuoc3: json['trangThaiBuoc3'],
      ketQuaBuoc3: json['ketQuaBuoc3'],
      trangThaiBuoc4: json['trangThaiBuoc4'],
      ketQuaBuoc4: json['ketQuaBuoc4'],
    );
  }
}
