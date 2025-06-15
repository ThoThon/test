import '../../src.dart';

class ResultLookupHistoryRegisterModel {
  final Buoc? buoc1;
  final Buoc? buoc2;
  final Buoc? buoc3;
  final String? trangThai;
  final String? soHoSo;
  final String? thoiGianGui;

  ResultLookupHistoryRegisterModel({
    this.buoc1,
    this.buoc2,
    this.buoc3,
    this.trangThai,
    this.soHoSo,
    this.thoiGianGui,
  });

  factory ResultLookupHistoryRegisterModel.fromJson(Map<String, dynamic> json) {
    final result = json['result'] ?? {};
    return ResultLookupHistoryRegisterModel(
      buoc1: Buoc.fromJson(json['buoc_1'] ?? {}),
      buoc2: Buoc.fromJson(json['buoc_2'] ?? {}),
      buoc3: Buoc.fromJson(json['buoc_3'] ?? {}),
      trangThai: result['trangThai'] ?? '',
      soHoSo: result['soHoSo'] ?? '',
      thoiGianGui: result['thoiGianGui'] ?? '',
    );
  }
}
