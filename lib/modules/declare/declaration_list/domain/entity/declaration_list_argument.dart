import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/procedure_type.dart';

import '../../../staff_list/domain/entity/save_xml_result.dart'; 

class DeclarationListArgument {
  final String declarationPeriodId;
  final SaveXmlResultCl saveXmlResult;
  final ProcedureType procedureType;

  const DeclarationListArgument({
    required this.declarationPeriodId,
    required this.saveXmlResult,
    required this.procedureType,
  });
}
