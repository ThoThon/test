import 'package:v_bhxh/modules/declare/declaration_period/model/model_src.dart';

enum DeclareInfoAction {
  create,
  edit,
}

class DeclareInfoArgument {
  final DeclareInfoAction action;
  final DeclarationPeriodModel? period;

  const DeclareInfoArgument({
    required this.action,
    this.period,
  });
}
