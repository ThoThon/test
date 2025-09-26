import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/selected_staff/data/model/staff_detail_data.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/staff_detail.dart';

class StaffDetailDataMapper
    extends BaseDataMapper<StaffDetailData, StaffDetail> {
  @override
  StaffDetail mapToEntity(StaffDetailData? data) {
    return StaffDetail(
      id: data?.id ?? '',
      fullName: data?.hoTen ?? '',
      bhxhNumber: data?.maSoBHXH ?? '',
      cccdNumber: data?.soCCCD ?? '',
      position: data?.chucVu ?? '',
    );
  }
}
