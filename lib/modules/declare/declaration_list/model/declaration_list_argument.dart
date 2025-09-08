import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/procedure_type.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/save_xml_result.dart';

class DeclarationListArgument {
  final String declarationPeriodId;
  final SaveXmlResult saveXmlResult;
  final ProcedureType procedureType;

  const DeclarationListArgument({
    required this.declarationPeriodId,
    required this.saveXmlResult,
    required this.procedureType,
  });
}
