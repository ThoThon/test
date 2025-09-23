import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/select_staff_cl/data/model/staff_info_data.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/entity/staff_info.dart';

class StaffInfoDataMapper extends BaseDataMapper<StaffInfoData, StaffInfo> {
  @override
  StaffInfo mapToEntity(StaffInfoData? data) {
    return StaffInfo(
      id: data?.id ?? '',
      hoTen: data?.hoTen ?? '',
      maSoBHXH: data?.maSoBHXH ?? '',
      soCCCD: data?.soCCCD ?? '',
      chucVu: data?.chucVu ?? '',
    );
  }
}
