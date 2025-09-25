import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class SelectStaffRequest implements Entity {
  final int pageIndex;
  final int pageSize;
  final String? fullName;
  final String? bhxhNumber;

  SelectStaffRequest({
    required this.pageIndex,
    required this.pageSize,
    this.fullName,
    this.bhxhNumber,
  });
}
