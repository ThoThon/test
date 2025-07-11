import 'package:v_bhxh/modules/declare/declaration_period/model/procedure_type.dart';

enum D02ActionEnum {
  // Thêm mới nhân viên từ màn "Danh sách nhân viên"
  addStaffFromStaffList,
  // Chỉnh sửa thông tin nhân viên từ màn "Danh sách nhân viên"
  updateStaffFromStaffList,
  // Tạo đợt mới từ màn "Đợt kê khai"
  addPeriodFromDeclarePeriod,

  // Tất cả đều được truyền đến màn "Kê khai thông tin"
}

class DeclareInfoArgument {
  /// id kỳ kê khai
  final String declarationPeriodId;

  /// id của nhân viên trong kỳ khai
  final String? staffId;

  final D02ActionEnum action;

  final ProcedureType procedureType;

  const DeclareInfoArgument({
    required this.declarationPeriodId,
    this.staffId,
    required this.action,
    required this.procedureType,
  });

  bool get isUpdateStaff => action == D02ActionEnum.updateStaffFromStaffList;

  bool get isAddStaffFromStaffList =>
      action == D02ActionEnum.addStaffFromStaffList;

  bool get isAddPeriodFromDeclarePeriod =>
      action == D02ActionEnum.addPeriodFromDeclarePeriod;
}
