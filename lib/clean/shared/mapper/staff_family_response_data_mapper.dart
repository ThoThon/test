import 'package:v_bhxh/clean/shared/mapper/category_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/data/model/staff_family_response_data.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/entity/staff_family_response_cl.dart';

class StaffFamilyResponseDataMapper
    extends BaseDataMapper<StaffFamilyResponseDataCl, StaffFamilyResponseCl> {
  final RelationshipDataMapper _relationshipDataMapper;
  final ProvinceDataMapper _provinceDataMapper;
  final WardDataMapper _wardDataMapper;
  final CategoryDataMapper _categoryDataMapper;

  StaffFamilyResponseDataMapper(
    this._relationshipDataMapper,
    this._provinceDataMapper,
    this._wardDataMapper,
    this._categoryDataMapper,
  );

  @override
  StaffFamilyResponseCl mapToEntity(StaffFamilyResponseDataCl? data) {
    return StaffFamilyResponseCl(
      id: data?.id,
      fullName: data?.hoTen,
      dateOfBirth: data?.ngaySinh,
      relationship: _relationshipDataMapper.mapToEntity(data?.moiQuanHe),
      socialInsuranceNumber: data?.maSoBhxh,
      gender: data?.gioiTinh ?? 0,
      birthProvince: _provinceDataMapper.mapToEntity(data?.tinhKhaiSinh),
      birthWard: _wardDataMapper.mapToEntity(data?.xaKhaiSinh),
      identityCard: data?.cmnd,
      onlyYearOfBirth: data?.chiCoNamSinh ?? 0,
      nationality: _categoryDataMapper.mapToEntity(data?.quocTichs),
      ethnicity: _categoryDataMapper.mapToEntity(data?.danTocs),
    );
  }
}
