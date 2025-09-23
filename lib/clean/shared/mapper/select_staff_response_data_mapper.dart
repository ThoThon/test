import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/staff_info_data_mapper.dart';
import 'package:v_bhxh/modules/select_staff_cl/data/model/select_staff_response_data.dart';

import '../../../modules/select_staff_cl/domain/entity/select_staff_response.dart';

class SelectStaffResponseDataMapper
    extends BaseDataMapper<SelectStaffResponseData, SelectStaffResponse> {
  final StaffInfoDataMapper _staffInfoDataMapper;
  SelectStaffResponseDataMapper(this._staffInfoDataMapper);

  @override
  SelectStaffResponse mapToEntity(SelectStaffResponseData? data) {
    return SelectStaffResponse(
      nhanSus: _staffInfoDataMapper.mapToListEntity(data?.nhanSus),
      total: data?.total ?? 0,
    );
  }
}
