import 'package:collection/collection.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/birth_type_enum.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class D02DetailResponse {
  final String id;
  final String kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final DeclarationTypeModel? loaiHoSo;
  final AdjustmentPlanModel? phuongAn;
  final bool xuatTk01;
  final String? cmnd;
  final BirthTypeEnum chiCoNamSinh;
  final DateTime? ngaySinh;
  final Gender? gioiTinh;
  final EthnicModel? danToc;
  final NationModel? quocTich;
  final String? tuThang;
  final String? denThang;
  final String? chucVu;
  final String? noiLamViec;
  final bool dongTheoHeSo;
  final String? tienLuong;
  final double? phuCapChucVu;
  final double? phuCapThamNienVuotKhung;
  final double? phuCapThamNienNghe;
  final String? phuCapLuong;
  final String? phuCapBoSung;
  final String? ghiChu;
  final bool xuatD01;

  const D02DetailResponse({
    required this.id,
    required this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    this.loaiHoSo,
    this.phuongAn,
    required this.xuatTk01,
    this.cmnd,
    required this.chiCoNamSinh,
    this.ngaySinh,
    this.gioiTinh,
    this.danToc,
    this.quocTich,
    this.tuThang,
    this.denThang,
    this.chucVu,
    this.noiLamViec,
    required this.dongTheoHeSo,
    this.tienLuong,
    this.phuCapChucVu,
    this.phuCapThamNienVuotKhung,
    this.phuCapThamNienNghe,
    this.phuCapLuong,
    this.phuCapBoSung,
    this.ghiChu,
    required this.xuatD01,
  });

  factory D02DetailResponse.fromJson(Map<String, dynamic> json) {
    final int? loaiHoSo = json['loaiHoSo'];
    final declarationType = AppData.instance.declarationTypes.firstWhereOrNull(
      (type) => type.value == loaiHoSo,
    );
    final String? phuongAnId = json['phuongAnId'];
    final plan = declarationType?.plans.firstWhereOrNull(
      (plan) => plan.id == phuongAnId,
    );

    return D02DetailResponse(
      id: json['id'] ?? '',
      kyKeKhaiId: json['kyKeKhaiId'] ?? '',
      hoTen: json['hoTen'],
      maSoBhxh: json['maSoBhxh'],
      loaiHoSo: declarationType,
      phuongAn: plan,
      xuatTk01: json['xuatTk01'] ?? false,
      cmnd: json['cmnd'],
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']) ??
          BirthTypeEnum.defaultValue,
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.tryParse(json['ngaySinh']) : null,
      gioiTinh: Gender.parse(json['gioiTinh']),
      danToc:
          json['danToc'] != null ? EthnicModel.fromJson(json['danToc']) : null,
      quocTich: json['quocTich'] != null
          ? NationModel.fromJson(json['quocTich'])
          : null,
      tuThang: json['tuThang'] ?? '',
      denThang: json['denThang'] ?? '',
      chucVu: json['chucVu'],
      noiLamViec: json['noiLamViec'],
      dongTheoHeSo: json['dongTheoHeSo'] ?? false,
      tienLuong: json['tienLuong'],
      phuCapChucVu: json['phuCapChucVu']?.toDouble(),
      phuCapThamNienVuotKhung: json['phuCapThamNienVuotKhung']?.toDouble(),
      phuCapThamNienNghe: json['phuCapThamNienNghe']?.toDouble(),
      phuCapLuong: json['phuCapLuong'],
      phuCapBoSung: json['phuCapBoSung'],
      ghiChu: json['ghiChu'],
      xuatD01: json['xuatD01'] ?? false,
    );
  }
}
