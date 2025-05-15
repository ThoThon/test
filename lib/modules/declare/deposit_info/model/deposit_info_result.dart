enum DepositInfoResultAction {
  selectD02Tab,
}

class DepositInfoResult {
  final DepositInfoResultAction action;

  const DepositInfoResult({
    required this.action,
  });
}
