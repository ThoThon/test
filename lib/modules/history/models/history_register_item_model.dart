class HistoryRegisterItemModel {
  final String messId;
  final String toKhai;
  final String thoiGianGui;
  final String kqBuoc1;
  final String kqBuoc2;
  final String kqBuoc3;
  final String trangThaiTK;
  final String soHoSo;
  final String tiepNhan;
  final int nam;
  final int thang;

  HistoryRegisterItemModel({
    required this.messId,
    required this.toKhai,
    required this.thoiGianGui,
    required this.kqBuoc1,
    required this.kqBuoc2,
    required this.kqBuoc3,
    required this.trangThaiTK,
    required this.soHoSo,
    required this.tiepNhan,
    required this.nam,
    required this.thang,
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
    );
  }
}
