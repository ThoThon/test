import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/declared_staff_data.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/declared_staff.dart';

class DeclaredStaffDataMapper
    extends BaseDataMapper<DeclaredStaffData, DeclaredStaff> {
  @override
  DeclaredStaff mapToEntity(DeclaredStaffData? data) {
    return DeclaredStaff(
      id: data?.id ?? '',
      index: data?.index ?? 0,
      name: data?.name ?? '',
      bhxhNumber: data?.bhxhNumber ?? '',
    );
  }
}
