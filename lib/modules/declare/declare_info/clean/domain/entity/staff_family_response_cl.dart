import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/category.dart';

import '../../../../../../clean/shared/entity/entity_src.dart';

class StaffFamilyResponseCl implements Entity{
  final String? id;
  final String? hoTen;
  final String? ngaySinh;
  final Relationship moiQuanHe;
  final String? maSoBhxh;
  final int gioiTinh;
  final Province? tinhKhaiSinh;
  final Ward? xaKhaiSinh;
  final String? cmnd;
  final int chiCoNamSinh;
  final Category? quocTichs;
  final Category? danTocs;

  const StaffFamilyResponseCl({
    this.id,
    this.hoTen,
    this.ngaySinh,
    required this.moiQuanHe,
    this.maSoBhxh,
    required this.gioiTinh,
    this.tinhKhaiSinh,
    this.xaKhaiSinh,
    this.cmnd,
    required this.chiCoNamSinh,
    this.quocTichs,
    this.danTocs,
  });
}
