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
  final EthnicModel? danToc;
  final NationModel? quocTich;
  final ProvinceModel? khaiSinhTinh;
  final DistrictModel? khaiSinhHuyen;
  final WardModel? khaiSinhXa;
  final RelationshipModel? moiQuanHe;
  final String? cmnd;
  final String? ghiChu;
  final bool laNguoiThamGia;
  final String? giaDinhId;
  final bool isUpdate;

  const MemberDetailResponse({
    this.id,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    required this.chiCoNamSinh,
    this.ngaySinh,
    required this.gioiTinh,
    this.danToc,
    this.quocTich,
    this.khaiSinhTinh,
    this.khaiSinhHuyen,
    this.khaiSinhXa,
    this.moiQuanHe,
    this.cmnd,
    this.ghiChu,
    required this.laNguoiThamGia,
    this.giaDinhId,
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
      danToc: json['danTocs'] != null
          ? EthnicModel.fromJson(json['danTocs'])
          : null,
      quocTich: json['quocTichs'] != null
          ? NationModel.fromJson(json['quocTichs'])
          : null,
      khaiSinhTinh: json['khaiSinhTinh'] != null
          ? ProvinceModel.fromJson(json['khaiSinhTinh'])
          : null,
      khaiSinhHuyen: json['khaiSinhHuyen'] != null
          ? DistrictModel.fromJson(json['khaiSinhHuyen'])
          : null,
      khaiSinhXa: json['khaiSinhXa'] != null
          ? WardModel.fromJson(json['khaiSinhXa'])
          : null,
      moiQuanHe: json['moiQuanHes'] != null
          ? RelationshipModel.fromJson(json['moiQuanHes'])
          : null,
      cmnd: json['cmnd'],
      laNguoiThamGia: json['laNguoiThamGia'] ?? false,
      ghiChu: json['ghiChu'],
      giaDinhId: json['giaDinhId'],
      isUpdate: json['isUpdate'] ?? false,
    );
  }
}
