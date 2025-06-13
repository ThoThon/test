enum D02TypeEnum {
  // Thêm mới nhân viên
  addStaff,
  // Chỉnh sửa thông tin nhân viên
  updateStaff,
  // Tạo đợt mới
  addPeriod,
}

class DeclareInfoArgument {
  /// id kỳ kê khai
  final String declarationPeriodId;

  /// id của nhân viên trong kỳ khai
  final String? staffId;

  final D02TypeEnum? type;

  const DeclareInfoArgument({
    required this.declarationPeriodId,
    this.staffId,
    this.type,
  });

  bool get isUpdate => staffId != null;
}
