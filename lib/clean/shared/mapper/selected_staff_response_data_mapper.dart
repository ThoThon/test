import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/staff_detail_data_mapper.dart';
import 'package:v_bhxh/modules/selected_staff/data/model/selected_staff_response_data.dart';

import '../../../modules/selected_staff/domain/entity/selected_staff_response.dart';

class SelectStaffResponseDataMapper
    extends BaseDataMapper<SelectStaffResponseData, SelectStaffResponse> {
  final StaffDetailDataMapper _staffInfoDataMapper;
  SelectStaffResponseDataMapper(this._staffInfoDataMapper);

  @override
  SelectStaffResponse mapToEntity(SelectStaffResponseData? data) {
    return SelectStaffResponse(
      nhanSus: _staffInfoDataMapper.mapToListEntity(data?.nhanSus),
      total: data?.total ?? 0,
    );
  }
}
