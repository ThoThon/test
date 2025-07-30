import 'package:v_bhxh/modules/declare/declaration_period/clean/domain/entity/procedure_type.dart';

class StaffListArgument {
  final String declarationPeriodId;

  /// Loại thủ tục
  final ProcedureType procedureType;

  const StaffListArgument({
    required this.declarationPeriodId,
    required this.procedureType,
  });
}
