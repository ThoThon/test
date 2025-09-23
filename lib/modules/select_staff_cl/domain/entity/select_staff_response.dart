import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/entity/staff_info.dart';

class SelectStaffResponse implements Entity {
  final List<StaffInfo> nhanSus;
  final int total;

  SelectStaffResponse({
    required this.nhanSus,
    required this.total,
  });
}
