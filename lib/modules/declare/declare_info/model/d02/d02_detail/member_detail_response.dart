import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/birth_type_enum.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class MemberDetailResponse {
  final String? id;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final BirthTypeEnum chiCoNamSinh;
  final DateTime? ngaySinh;
  final Gender gioiTinh;
  final EthnicModel danToc;
  final NationModel quocTich;
  final ProvinceModel khaiSinhTinh;
  final DistrictModel khaiSinhHuyen;
  final WardModel khaiSinhXa;
  final RelationshipModel moiQuanHe;
  final String? cmnd;
  final String? ghiChu;
  final bool laNguoiThamGia;
  final bool isUpdate;

  const MemberDetailResponse({
    this.id,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    required this.chiCoNamSinh,
    this.ngaySinh,
    required this.gioiTinh,
    required this.danToc,
    required this.quocTich,
    required this.khaiSinhTinh,
    required this.khaiSinhHuyen,
    required this.khaiSinhXa,
    required this.moiQuanHe,
    this.cmnd,
    this.ghiChu,
    required this.laNguoiThamGia,
    required this.isUpdate,
  });

  factory MemberDetailResponse.fromJson(Map<String, dynamic> json) {
    return MemberDetailResponse(
      id: json['id'],
      kyKeKhaiId: json['kyKeKhaiId'],
      hoTen: json['hoTen'],
      maSoBhxh: json['maSoBhxh'],
      chiCoNamSinh: BirthTypeEnum.parse(json['chiCoNamSinh']) ??
          BirthTypeEnum.defaultValue,
      ngaySinh:
          json['ngaySinh'] != null ? DateTime.tryParse(json['ngaySinh']) : null,
      gioiTinh: Gender.parse(json['gioiTinh']) ?? Gender.male,
      danToc: EthnicModel.fromJson(json['danTocs']),
      quocTich: NationModel.fromJson(json['quocTichs']),
      khaiSinhTinh: ProvinceModel.fromJson(json['khaiSinhTinh']),
      khaiSinhHuyen: DistrictModel.fromJson(json['khaiSinhHuyen']),
      khaiSinhXa: WardModel.fromJson(json['khaiSinhXa']),
      moiQuanHe: RelationshipModel.fromJson(json['moiQuanHes']),
      laNguoiThamGia: json['laNguoiThamGia'] ?? false,
      isUpdate: json['isUpdate'] ?? false,
    );
  }
}
