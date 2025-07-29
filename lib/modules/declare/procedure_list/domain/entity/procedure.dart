import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';
import 'package:v_bhxh/modules/declare/declaration_period/model/procedure_type.dart';

/// Thủ tục kê khai
class Procedure implements Entity {
  final String name;
  final String parentName;

  /// Loại thủ tục
  final ProcedureType type;
  final String code;
  final String note;

  const Procedure({
    required this.name,
    required this.parentName,
    required this.type,
    required this.code,
    required this.note,
  });
}
