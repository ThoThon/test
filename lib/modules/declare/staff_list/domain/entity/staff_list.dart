import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'attached_image.dart';
import 'declared_staff.dart';

class StaffList implements Entity {
  final List<DeclaredStaff> staffs;
  final List<AttachedImage> image;

  StaffList({
    required this.staffs,
    required this.image,
  });
}
