class HistoryRegisterItemModel {
  String messId;
  String toKhai;
  String thoiGianGui;
  String? kqBuoc1;
  String? kqBuoc2;
  String? kqBuoc3;
  String trangThaiTK;
  String? soHoSo;
  String? tiepNhan;
  int nam;
  int thang;
  bool? trangThaiBuoc1;
  bool? trangThaiBuoc2;
  bool? trangThaiBuoc3;

  HistoryRegisterItemModel({
    required this.messId,
    required this.toKhai,
    required this.thoiGianGui,
    this.kqBuoc1,
    this.kqBuoc2,
    this.kqBuoc3,
    required this.trangThaiTK,
    this.soHoSo,
    this.tiepNhan,
    required this.nam,
    required this.thang,
    this.trangThaiBuoc1,
    this.trangThaiBuoc2,
    this.trangThaiBuoc3,
  });

  factory HistoryRegisterItemModel.fromJson(Map<String, dynamic> json) {
    return HistoryRegisterItemModel(
      messId: json['messId'] ?? '',
      toKhai: json['toKhai'] ?? '',
      thoiGianGui: json['thoiGianGui'] ?? '',
      kqBuoc1: json['kqBuoc1'] ?? '',
      kqBuoc2: json['kqBuoc2'] ?? '',
      kqBuoc3: json['kqBuoc3'] ?? '',
      trangThaiTK: json['trangThaiTK'] ?? '',
      soHoSo: json['soHoSo'] ?? '',
      tiepNhan: json['tiepNhan'] ?? '',
      nam: json['nam'] ?? 0,
      thang: json['thang'] ?? 0,
      trangThaiBuoc1: json['trangThaiBuoc1'],
      trangThaiBuoc2: json['trangThaiBuoc2'],
      trangThaiBuoc3: json['trangThaiBuoc3'],
    );
  }
}
