import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';
import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/declaration_status.dart';

class DeclarationPeriod implements Entity {
  final String id;

  /// Mã công ty
  final String companyId;

  /// Mã thủ tục
  final int procedureId;

  /// Trạng thái hồ sơ
  final DeclarationStatus status;
  final int year;
  final int month;
  final int period;
  final bool selected;
  final DateTime? createTime;
  final DateTime? updateDate;

  /// Số hồ sơ
  final String? fileNumber;

  DeclarationPeriod({
    required this.id,
    required this.companyId,
    required this.procedureId,
    required this.status,
    required this.year,
    required this.month,
    required this.period,
    required this.selected,
    this.createTime,
    this.updateDate,
    this.fileNumber,
  });
}
