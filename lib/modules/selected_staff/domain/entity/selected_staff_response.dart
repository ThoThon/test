import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/staff_detail.dart';

class SelectStaffResponse implements Entity {
  final List<StaffDetail> nhanSus;
  final int total;

  SelectStaffResponse({
    required this.nhanSus,
    required this.total,
  });
}
