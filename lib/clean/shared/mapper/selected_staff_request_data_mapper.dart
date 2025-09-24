import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/selected_staff/data/model/selected_staff_request_data.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_request.dart';

class SelectStaffRequestDataMapper
    extends BaseDataMapper<SelectStaffRequestData, SelectStaffRequest>
    with DataMapperMixin {
  @override
  SelectStaffRequest mapToEntity(SelectStaffRequestData? data) {
    return SelectStaffRequest(
      pageIndex: data?.pageIndex ?? 0,
      pageSize: data?.pageSize ?? 0,
      hoTen: data?.hoTen,
      maSoBHXH: data?.maSoBHXH,
    );
  }

  @override
  SelectStaffRequestData mapToData(SelectStaffRequest entity) {
    return SelectStaffRequestData(
      pageIndex: entity.pageIndex,
      pageSize: entity.pageSize,
      hoTen: entity.hoTen,
      maSoBHXH: entity.maSoBHXH,
    );
  }
}
