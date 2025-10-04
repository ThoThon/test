import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/domain/entity/staff_info.dart';

import '../../../modules/history/data/model/staff_info_data.dart';

class StaffInfoDataMapper extends BaseDataMapper<StaffInfoData, StaffInfo> {
  @override
  StaffInfo mapToEntity(StaffInfoData? data) {
    return StaffInfo(
      staffId: data?.id ?? '',
      stt: data?.stt ?? 0,
      name: data?.hoTen ?? '',
      bhxhNumber: data?.maSoBHXH ?? '',
    );
  }
}
