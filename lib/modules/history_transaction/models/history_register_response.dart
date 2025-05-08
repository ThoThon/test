class HistoryRegisterModel {
  String id;
  String congTyId;
  String messId;
  String toKhai;
  String thoiGianGui;
  String kqBuoc1;
  String kqBuoc2;
  String kqBuoc3;
  String trangThai;
  String soHoSo;
  String tiepNhan;
  String kqBuoc4;

  HistoryRegisterModel({
    required this.id,
    required this.congTyId,
    required this.messId,
    required this.toKhai,
    required this.thoiGianGui,
    required this.kqBuoc1,
    required this.kqBuoc2,
    required this.kqBuoc3,
    required this.trangThai,
    required this.soHoSo,
    required this.tiepNhan,
    required this.kqBuoc4,
  });

  factory HistoryRegisterModel.fromJson(Map<String, dynamic> json) {
    return HistoryRegisterModel(
      id: json['id'] ?? "",
      congTyId: json['congTyId'] ?? "",
      messId: json['messId'] ?? "",
      toKhai: json['toKhai'] ?? "",
      thoiGianGui: json['thoiGianGui'] ?? "",
      kqBuoc1: json['kqBuoc1'] ?? "",
      kqBuoc2: json['kqBuoc2'] ?? "",
      kqBuoc3: json['kqBuoc3'] ?? "",
      trangThai: json['trangThai'] ?? "",
      soHoSo: json['soHoSo'] ?? "",
      tiepNhan: json['tiepNhan'] ?? "",
      kqBuoc4: json['kqBuoc4'] ?? "",
    );
  }
}
