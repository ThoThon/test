import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/selected_staff/data/model/selected_staff_request_data.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_request.dart';

import '../../../core/values/const.dart';

class SelectStaffRequestDataMapper
    extends BaseDataMapper<SelectStaffRequestData, SelectStaffRequest>
    with DataMapperMixin {
  @override
  SelectStaffRequest mapToEntity(SelectStaffRequestData? data) {
    return SelectStaffRequest(
      pageIndex: data?.pageIndex ?? AppConst.defaultPageNumber,
      pageSize: data?.pageSize ?? AppConst.defaultPageSize,
      fullName: data?.hoTen,
      bhxhNumber: data?.maSoBHXH,
    );
  }

  @override
  SelectStaffRequestData mapToData(SelectStaffRequest entity) {
    return SelectStaffRequestData(
      pageIndex: entity.pageIndex,
      pageSize: entity.pageSize,
      hoTen: entity.fullName,
      maSoBHXH: entity.bhxhNumber,
    );
  }
}
