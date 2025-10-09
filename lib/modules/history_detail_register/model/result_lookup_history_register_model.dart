import 'package:v_bhxh/modules/history_detail_declare/data/model/step_data.dart';

class ResultLookupHistoryRegisterModel {
  final StepData? buoc1;
  final StepData? buoc2;
  final StepData? buoc3;
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
    return ResultLookupHistoryRegisterModel(
      buoc1: json['buoc_1'] != null ? StepData.fromJson(json['buoc_1']) : null,
      buoc2: json['buoc_2'] != null ? StepData.fromJson(json['buoc_2']) : null,
      buoc3: json['buoc_3'] != null ? StepData.fromJson(json['buoc_3']) : null,
      trangThai: json['trangThai'] ?? '',
      soHoSo: json['soHoSo'] ?? '',
      thoiGianGui: json['thoiGianGui'] ?? '',
    );
  }
}
