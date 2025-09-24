import 'package:v_bhxh/clean/shared/model/category_data.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';

import '../../../../family_member_detail/domain/entity/birth_type_enum.dart';
import '../../../model/gender.dart';

class StaffFamilyResponseDataCl {
  final String? id;
  final String? hoTen;
  final String? ngaySinh;
  final RelationshipData? moiQuanHe;
  final String? maSoBhxh;
  final Gender? gioiTinh;
  final ProvinceData? tinhKhaiSinh;
  final WardData? xaKhaiSinh;
  final String? cmnd;
  final BirthTypeEnum? chiCoNamSinh;
  final CategoryData? quocTichs;
  final CategoryData? danTocs;

  const StaffFamilyResponseDataCl({
    this.id,
    this.hoTen,
    this.ngaySinh,
    this.moiQuanHe,
    this.maSoBhxh,
    this.gioiTinh,
    this.tinhKhaiSinh,
    this.xaKhaiSinh,
    this.cmnd,
    this.chiCoNamSinh,
    this.quocTichs,
    this.danTocs,
  });
  factory StaffFamilyResponseDataCl.fromJson(Map<String, dynamic> json) {
    return StaffFamilyResponseDataCl(
      id: json['id'],
      hoTen: json['hoTen'],
      ngaySinh: json['ngaySinh'],
      moiQuanHe: RelationshipData.fromJson(json['moiQuanHe']),
      maSoBhxh: json['maSoBhxh'],
      gioiTinh: Gender.parse(json['gioiTinh']),
      tinhKhaiSinh: ProvinceData.fromJson(json['tinhKhaiSinh']),
      xaKhaiSinh: WardData.fromJson(json['xaKhaiSinh']),
      cmnd: json['cmnd'],
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']) ??
          BirthTypeEnum.defaultValue,
      quocTichs: CategoryData.fromJson(json['quocTichs']),
      danTocs: CategoryData.fromJson(json['danTocs']),
    );
  }
}
