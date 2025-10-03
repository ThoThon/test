import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/staff_detail.dart';

class SelectStaffResponse implements Entity {
  final List<StaffDetail> staff;
  final int total;

  SelectStaffResponse({
    required this.staff,
    required this.total,
  });
}
