enum StaffListResultAction {
  selectD02Tab,
}

class StaffListResult {
  final StaffListResultAction action;

  const StaffListResult({
    required this.action,
  });
}
