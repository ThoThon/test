import 'package:v_bhxh/modules/history_detail_declare_cl/data/model/step_data.dart';

class DeclareHistoryLookupResultData {
  final StepData? buoc1;
  final StepData? buoc2;
  final StepData? buoc3;
  final StepData? buoc4;
  final String? trangThai;

  DeclareHistoryLookupResultData({
    this.buoc1,
    this.buoc2,
    this.buoc3,
    this.buoc4,
    this.trangThai,
  });

  factory DeclareHistoryLookupResultData.fromJson(Map<String, dynamic> json) {
    return DeclareHistoryLookupResultData(
      buoc1: json['buoc_1'] != null
          ? StepData.fromJson(json['buoc_1'] as Map<String, dynamic>)
          : null,
      buoc2: json['buoc_2'] != null
          ? StepData.fromJson(json['buoc_2'] as Map<String, dynamic>)
          : null,
      buoc3: json['buoc_3'] != null
          ? StepData.fromJson(json['buoc_3'] as Map<String, dynamic>)
          : null,
      buoc4: json['buoc_4'] != null
          ? StepData.fromJson(json['buoc_4'] as Map<String, dynamic>)
          : null,
      trangThai: json['trangThai'],
    );
  }
}
