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
      buoc1: StepData.fromJson(json['buoc_1']),
      buoc2: StepData.fromJson(json['buoc_2']),
      buoc3: StepData.fromJson(json['buoc_3']),
      buoc4: StepData.fromJson(json['buoc_4']),
      trangThai: json['trangThai'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'buoc_1': buoc1?.toJson(),
      'buoc_2': buoc2?.toJson(),
      'buoc_3': buoc3?.toJson(),
      'buoc_4': buoc4?.toJson(),
    };
  }
}
