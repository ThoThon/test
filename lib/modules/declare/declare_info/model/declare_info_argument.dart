enum DeclareInfoAction {
  create,
  edit,
}

class DeclareInfoArgument {
  final DeclareInfoAction action;
  final String declarationPeriodId;

  const DeclareInfoArgument({
    required this.action,
    required this.declarationPeriodId,
  });
}
