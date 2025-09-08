import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/birth_type_enum.dart';

class StaffFamilyResponse {
  final String? id;
  final String? hoTen;
  final DateTime? ngaySinh;
  final Relationship moiQuanHe;
  final String? maSoBhxh;
  final Gender gioiTinh;
  final Province? tinhKhaiSinh;
  final District? huyenKhaiSinh;
  final Ward? xaKhaiSinh;
  final String? cmnd;
  final BirthTypeEnum chiCoNamSinh;
  final Nation? quocTichs;
  final Ethnic? danTocs;

  const StaffFamilyResponse({
    this.id,
    this.hoTen,
    this.ngaySinh,
    required this.moiQuanHe,
    this.maSoBhxh,
    required this.gioiTinh,
    this.tinhKhaiSinh,
    this.huyenKhaiSinh,
    this.xaKhaiSinh,
    this.cmnd,
    required this.chiCoNamSinh,
    this.quocTichs,
    this.danTocs,
  });

  factory StaffFamilyResponse.fromJson(Map<String, dynamic> json) {
    return StaffFamilyResponse(
      id: json['id'],
      hoTen: json['hoTen'],
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.tryParse(json['ngaySinh']) : null,
      moiQuanHe: Relationship.fromJson(json['moiQuanHe']),
      maSoBhxh: json['maSoBhxh'],
      gioiTinh: Gender.parse(json['gioiTinh']) ?? Gender.male,
      tinhKhaiSinh: json['tinhKhaiSinh'] != null
          ? Province.fromJson(json['tinhKhaiSinh'])
          : null,
      huyenKhaiSinh: json['huyenKhaiSinh'] != null
          ? District.fromJson(json['huyenKhaiSinh'])
          : null,
      xaKhaiSinh:
          json['xaKhaiSinh'] != null ? Ward.fromJson(json['xaKhaiSinh']) : null,
      cmnd: json['cmnd'],
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']) ??
          BirthTypeEnum.defaultValue,
      quocTichs:
          json['quocTichs'] != null ? Nation.fromJson(json['quocTichs']) : null,
      danTocs:
          json['danTocs'] != null ? Ethnic.fromJson(json['danTocs']) : null,
    );
  }
}
