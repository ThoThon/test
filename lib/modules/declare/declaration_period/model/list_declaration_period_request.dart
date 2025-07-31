import 'package:v_bhxh/modules/src.dart';

class ListDeclarationPeriodRequest {
  final int periodId;
  final int month;
  final int year;
  final PeriodStatusFilter filterStatus;

  const ListDeclarationPeriodRequest({
    required this.periodId,
    required this.month,
    required this.year,
    required this.filterStatus,
  });

  Map<String, dynamic> toJson() {
    return {
      'maThuTuc': periodId,
      'thang': month,
      'nam': year,
      'trangThai': filterStatus.statusNumber,
    };
  }
}
