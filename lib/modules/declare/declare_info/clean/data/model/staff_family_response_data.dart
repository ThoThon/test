import 'package:v_bhxh/clean/shared/model/category_data.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';

class StaffFamilyResponseDataCl {
  final String? id;
  final String? hoTen;
  final String? ngaySinh;
  final RelationshipData? moiQuanHe;
  final String? maSoBhxh;
  final int? gioiTinh;
  final ProvinceData? tinhKhaiSinh;
  final WardData? xaKhaiSinh;
  final String? cmnd;
  final int? chiCoNamSinh;
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
      moiQuanHe: json['moiQuanHe'] != null
          ? RelationshipData.fromJson(json['moiQuanHe'])
          : null,
      maSoBhxh: json['maSoBhxh'],
      gioiTinh: json['gioiTinh'],
      tinhKhaiSinh: json['tinhKhaiSinh'] != null
          ? ProvinceData.fromJson(json['tinhKhaiSinh'])
          : null,
      xaKhaiSinh: json['xaKhaiSinh'] != null
          ? WardData.fromJson(json['xaKhaiSinh'])
          : null,
      cmnd: json['cmnd'],
      chiCoNamSinh: json['chiCoNamSinh'],
      quocTichs: json['quocTichs'] != null
          ? CategoryData.fromJson(json['quocTichs'])
          : null,
      danTocs: json['danTocs'] != null
          ? CategoryData.fromJson(json['danTocs'])
          : null,
    );
  }
}
