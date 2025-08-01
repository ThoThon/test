import 'package:v_bhxh/modules/src.dart';

class ListDeclarationPeriodRequest {
  final int periodId;
  final int month;
  final int year;
  final DeclarationPeriodFilter filter;

  const ListDeclarationPeriodRequest({
    required this.periodId,
    required this.month,
    required this.year,
    required this.filter,
  });

  Map<String, dynamic> toJson() {
    return {
      'maThuTuc': periodId,
      'thang': month,
      'nam': year,
      'trangThai': filter.statusNumber,
    };
  }
}
