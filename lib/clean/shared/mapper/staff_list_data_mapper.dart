import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/staff_list_data.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/staff_list.dart';

class StaffListDataMapper extends BaseDataMapper<StaffListData, StaffList> {
  final DeclaredStaffDataMapper _declaredStaffDataMapper;
  final AttachedImageDataMapper _attachedImageDataMapper;

  StaffListDataMapper(
    this._attachedImageDataMapper,
    this._declaredStaffDataMapper,
  );
  @override
  StaffList mapToEntity(StaffListData? data) {
    return StaffList(
      staffs: _declaredStaffDataMapper.mapToListEntity(data?.staffs),
      image: _attachedImageDataMapper.mapToListEntity(data?.images),
    );
  }
}
