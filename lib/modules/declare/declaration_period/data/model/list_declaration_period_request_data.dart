import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/declaration_period_filter.dart';

class ListDeclarationPeriodRequestData {
  final int periodId;
  final int month;
  final int year;
  final DeclarationPeriodFilter filter;

  const ListDeclarationPeriodRequestData({
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
