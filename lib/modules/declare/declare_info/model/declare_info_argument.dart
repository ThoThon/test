class DeclareInfoArgument {
  /// id kỳ kê khai
  final String declarationPeriodId;

  /// id của nhân viên trong kỳ khai
  final String? staffId;

  const DeclareInfoArgument({
    required this.declarationPeriodId,
    this.staffId,
  });

  bool get isUpdate => staffId != null;
}
