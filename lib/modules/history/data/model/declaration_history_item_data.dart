class DeclarationHistoryItemData {
  final String? id;
  final String? maThuTuc;
  final String? thoiGianGui;
  final String? soHoSo;
  final String? thang;
  final String? nam;
  final String? trangThai;
  final String? maLoiBuoc1;
  final String? ketQuaBuoc1;
  final String? maLoiBuoc2;
  final String? ketQuaBuoc2;
  final String? maLoiBuoc3;
  final String? ketQuaBuoc3;
  final String? maLoiBuoc4;
  final String? ketQuaBuoc4;

  DeclarationHistoryItemData({
    this.id,
    this.maThuTuc,
    this.thoiGianGui,
    this.soHoSo,
    this.thang,
    this.nam,
    this.trangThai,
    this.maLoiBuoc1,
    this.ketQuaBuoc1,
    this.maLoiBuoc2,
    this.ketQuaBuoc2,
    this.maLoiBuoc3,
    this.ketQuaBuoc3,
    this.maLoiBuoc4,
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
      maLoiBuoc1: json['maLoiBuoc1'],
      ketQuaBuoc1: json['ketQuaBuoc1'],
      maLoiBuoc2: json['maLoiBuoc2'],
      ketQuaBuoc2: json['ketQuaBuoc2'],
      maLoiBuoc3: json['maLoiBuoc3'],
      ketQuaBuoc3: json['ketQuaBuoc3'],
      maLoiBuoc4: json['maLoiBuoc4'],
      ketQuaBuoc4: json['ketQuaBuoc4'],
    );
  }
}
