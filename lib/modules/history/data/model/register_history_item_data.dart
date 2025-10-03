class RegisterHistoryItemData {
  final String? messId;
  final String? toKhai;
  final String? thoiGianGui;
  final String? kqBuoc1;
  final String? kqBuoc2;
  final String? kqBuoc3;
  final String? trangThaiTK;
  final String? soHoSo;
  final String? tiepNhan;
  final int? nam;
  final int? thang;
  final bool? trangThaiBuoc1;
  final bool? trangThaiBuoc2;
  final bool? trangThaiBuoc3;

  RegisterHistoryItemData({
    this.messId,
    this.toKhai,
    this.thoiGianGui,
    this.kqBuoc1,
    this.kqBuoc2,
    this.kqBuoc3,
    this.trangThaiTK,
    this.soHoSo,
    this.tiepNhan,
    this.nam,
    this.thang,
    this.trangThaiBuoc1,
    this.trangThaiBuoc2,
    this.trangThaiBuoc3,
  });

  factory RegisterHistoryItemData.fromJson(Map<String, dynamic> json) {
    return RegisterHistoryItemData(
      messId: json['messId'],
      toKhai: json['toKhai'],
      thoiGianGui: json['thoiGianGui'],
      kqBuoc1: json['kqBuoc1'],
      kqBuoc2: json['kqBuoc2'],
      kqBuoc3: json['kqBuoc3'],
      trangThaiTK: json['trangThaiTK'],
      soHoSo: json['soHoSo'],
      tiepNhan: json['tiepNhan'],
      nam: json['nam'],
      thang: json['thang'],
      trangThaiBuoc1: json['trangThaiBuoc1'],
      trangThaiBuoc2: json['trangThaiBuoc2'],
      trangThaiBuoc3: json['trangThaiBuoc3'],
    );
  }
}
