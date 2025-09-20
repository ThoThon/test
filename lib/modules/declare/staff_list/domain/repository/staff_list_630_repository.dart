import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/entity_src.dart';

abstract class StaffList630Repository extends BaseRepositoryCl {
  Future<StaffList> getStaffList630a({
    required String declarationPeriodId,
  });

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ thủ tục 630a của nhân viên đó)
  Future<bool> delete630a({
    required String id,
  });

  Future<StaffList> getListStaff630b({
    required String declarationPeriodId,
  });

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ thủ tục 630b của nhân viên đó)
  Future<bool> delete630b({
    required String id,
  });

  Future<StaffList> getListStaff630c({
    required String declarationPeriodId,
  });

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ thủ tục 630b của nhân viên đó)
  Future<bool> delete630c({
    required String id,
  });
}
