import 'package:v_bhxh/clean/shared/mapper/category_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/data/model/staff_family_response_data_cl.dart';
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
      hoTen: data?.hoTen,
      ngaySinh: data?.ngaySinh,
      moiQuanHe: _relationshipDataMapper.mapToEntity(data?.moiQuanHe),
      maSoBhxh: data?.maSoBhxh,
      gioiTinh: data?.gioiTinh?.rawValue ?? 0,
      tinhKhaiSinh: _provinceDataMapper.mapToEntity(data?.tinhKhaiSinh),
      xaKhaiSinh: _wardDataMapper.mapToEntity(data?.xaKhaiSinh),
      cmnd: data?.cmnd,
      chiCoNamSinh: data?.chiCoNamSinh?.rawValue ?? 0,
      quocTichs: _categoryDataMapper.mapToEntity(data?.quocTichs),
      danTocs: _categoryDataMapper.mapToEntity(data?.danTocs),
    );
  }
}
