import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/procedure_type.dart';

import '../../../../src.dart';

class DeclarationListArgument {
  final String? declarationPeriodId;
  final SaveXmlResultCl? saveXmlResult;
  final ProcedureType? procedureType;
  final bool isFromHistoryPage;
  final DeclarationHistoryRecordList? declarationHistoryRecordList;

  const DeclarationListArgument({
    this.declarationPeriodId,
    this.saveXmlResult,
    this.procedureType,
    this.isFromHistoryPage = false,
    this.declarationHistoryRecordList,
  });
}
