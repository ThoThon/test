enum D02ActionEnum {
  // Thêm mới nhân viên từ màn "Danh sách nhân viên"
  addStaffFromStaffList,
  // Chỉnh sửa thông tin nhân viên từ màn "Danh sách nhân viên"
  updateStaffupdateStaffFromStaffList,
  // Tạo đợt mới từ màn "Đợt kê khai"
  addPeriodFromDeclarePeriod,

  // Tất cả đều được truyền đến màn "Kê khai thông tin"
}

class DeclareInfoArgument {
  /// id kỳ kê khai
  final String declarationPeriodId;

  /// id của nhân viên trong kỳ khai
  final String? staffId;

  final D02ActionEnum type;

  const DeclareInfoArgument({
    required this.declarationPeriodId,
    this.staffId,
    required this.type,
  });

  bool get isUpdate => staffId != null;

  bool get isUpdateStaffFromStaffList =>
      type == D02ActionEnum.updateStaffupdateStaffFromStaffList;

  bool get isAddStaffFromStaffList =>
      type == D02ActionEnum.addStaffFromStaffList;

  bool get isAddPeriodFromDeclarePeriod =>
      type == D02ActionEnum.addPeriodFromDeclarePeriod;
}
