import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/procedure_type.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/declaration_period_status.dart';

class DeclarationPeriod implements Entity {
  final String id;

  /// Mã công ty
  final String companyId;

  /// Mã thủ tục
  final int procedureId;

  /// Trạng thái hồ sơ
  final DeclarationPeriodStatus fileStatus;
  final int year;
  final int month;
  final int period;
  final bool selected;
  final DateTime? createTime;
  final DateTime? updateDate;

  /// Số hồ sơ
  final String? fileNumber;

  /// Loại thủ tục của kỳ khai báo
  final ProcedureType procedureType;

  DeclarationPeriod({
    required this.id,
    required this.companyId,
    required this.procedureId,
    required this.fileStatus,
    required this.year,
    required this.month,
    required this.period,
    required this.selected,
    required this.procedureType,
    this.createTime,
    this.updateDate,
    this.fileNumber,
  });

  // Disable 'Chỉnh sửa' và 'Xóa'
  bool get disableDeleteAndEdit => fileStatus == DeclarationPeriodStatus.sent;
}
