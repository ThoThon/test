import 'package:v_bhxh/modules/declare/declaration_period/model/procedure_type.dart';

class StaffListArgument {
  final String declarationPeriodId;
  final ProcedureType procedureType;

  const StaffListArgument({
    required this.declarationPeriodId,
    required this.procedureType,
  });
}
