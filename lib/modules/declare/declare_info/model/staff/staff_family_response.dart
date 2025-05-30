import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/birth_type_enum.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class StaffFamilyResponse {
  final String? hoTen;
  final DateTime? ngaySinh;
  final RelationshipModel moiQuanHe;
  final String? maSoBhxh;
  final Gender gioiTinh;
  final ProvinceModel? tinhKhaiSinh;
  final DistrictModel? huyenKhaiSinh;
  final WardModel? xaKhaiSinh;
  final String? cmnd;
  final BirthTypeEnum chiCoNamSinh;
  final NationModel? quocTich;
  final EthnicModel? danToc;

  const StaffFamilyResponse({
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
    this.quocTich,
    this.danToc,
  });

  factory StaffFamilyResponse.fromJson(Map<String, dynamic> json) {
    return StaffFamilyResponse(
      hoTen: json['hoTen'],
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.tryParse(json['ngaySinh']) : null,
      moiQuanHe: RelationshipModel.fromJson(json['moiQuanHe']),
      maSoBhxh: json['maSoBhxh'],
      gioiTinh: Gender.parse(json['gioiTinh']) ?? Gender.male,
      tinhKhaiSinh: json['tinhKhaiSinh'] != null
          ? ProvinceModel.fromJson(json['tinhKhaiSinh'])
          : null,
      huyenKhaiSinh: json['huyenKhaiSinh'] != null
          ? DistrictModel.fromJson(json['huyenKhaiSinh'])
          : null,
      xaKhaiSinh: json['xaKhaiSinh'] != null
          ? WardModel.fromJson(json['xaKhaiSinh'])
          : null,
      cmnd: json['cmnd'],
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']) ??
          BirthTypeEnum.defaultValue,
      quocTich: json['quocTich'] != null
          ? NationModel.fromJson(json['quocTich'])
          : null,
      danToc:
          json['danToc'] != null ? EthnicModel.fromJson(json['danToc']) : null,
    );
  }
}
