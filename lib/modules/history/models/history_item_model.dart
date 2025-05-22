class HistoryItemModel {
  String id;
  String maThuTuc;
  String thoiGianGui;
  String? soHoSo;
  String thang;
  String nam;
  String trangThai;
  String? maLoiBuoc1;
  String? ketQuaBuoc1;
  String? maLoiBuoc2;
  String? ketQuaBuoc2;
  String? maLoiBuoc3;
  String? ketQuaBuoc3;
  String? maLoiBuoc4;
  String? ketQuaBuoc4;

  HistoryItemModel({
    required this.id,
    required this.maThuTuc,
    required this.thoiGianGui,
    this.soHoSo,
    required this.thang,
    required this.nam,
    required this.trangThai,
    this.maLoiBuoc1,
    this.ketQuaBuoc1,
    this.maLoiBuoc2,
    this.ketQuaBuoc2,
    this.maLoiBuoc3,
    this.ketQuaBuoc3,
    this.maLoiBuoc4,
    this.ketQuaBuoc4,
  });

  factory HistoryItemModel.fromJson(Map<String, dynamic> json) {
    return HistoryItemModel(
      id: json['id'] ?? '',
      maThuTuc: json['maThuTuc'] ?? '',
      thoiGianGui: json['thoiGianGui'] ?? '',
      soHoSo: json['soHoSo'] ?? '',
      thang: json['thang'] ?? '',
      nam: json['nam'] ?? '',
      trangThai: json['trangThai'] ?? '',
      maLoiBuoc1: json['maLoiBuoc1'] ?? '',
      ketQuaBuoc1: json['ketQuaBuoc1'] ?? '',
      maLoiBuoc2: json['maLoiBuoc2'] ?? '',
      ketQuaBuoc2: json['ketQuaBuoc2'] ?? '',
      maLoiBuoc3: json['maLoiBuoc3'] ?? '',
      ketQuaBuoc3: json['ketQuaBuoc3'] ?? '',
      maLoiBuoc4: json['maLoiBuoc4'] ?? '',
      ketQuaBuoc4: json['ketQuaBuoc4'] ?? '',
    );
  }
}
