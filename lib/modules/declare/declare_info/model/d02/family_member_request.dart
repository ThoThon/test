import 'package:v_bhxh/modules/declare/declare_src.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/family_member.dart';

class FamilyMemberRequest {
  final String? id;
  final String? kyKeKhaiId;
  final String? hoTen;
  final String? maSoBhxh;
  final int chiCoNamSinh;
  final DateTime? ngaySinh;
  final int gioiTinh;
  final String? danToc;
  final String? quocTich;
  final String? khaiSinhTinhId;
  final String? khaiSinhHuyenId;
  final String? khaiSinhXaId;
  final String? moiQuanHe;
  final String? cmnd;
  final String? ghiChu;
  final bool laNguoiThamGia;
  final bool isUpdate;

  const FamilyMemberRequest({
    this.id,
    this.kyKeKhaiId,
    this.hoTen,
    this.maSoBhxh,
    required this.chiCoNamSinh,
    this.ngaySinh,
    required this.gioiTinh,
    this.danToc,
    this.quocTich,
    this.khaiSinhTinhId,
    this.khaiSinhHuyenId,
    this.khaiSinhXaId,
    this.moiQuanHe,
    this.cmnd,
    this.ghiChu,
    required this.laNguoiThamGia,
    required this.isUpdate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'kyKeKhaiId': kyKeKhaiId,
      'hoTen': hoTen,
      'maSoBhxh': maSoBhxh,
      'ngaySinh': ngaySinh?.toIso8601String(),
      'gioiTinh': gioiTinh,
      'danToc': danToc,
      'quocTich': quocTich,
      'khaiSinhTinhId': khaiSinhTinhId,
      'khaiSinhHuyenId': khaiSinhHuyenId,
      'khaiSinhXaId': khaiSinhXaId,
      'moiQuanHe': moiQuanHe,
      'cmnd': cmnd,
      'ghiChu': ghiChu,
      'laNguoiThamGia': laNguoiThamGia,
      'isUpdate': isUpdate,
    };
  }

  static List<FamilyMemberRequest> fromState({
    required String kyKeKhaiId,
    required Tk1State tk1State,
  }) {
    return tk1State.familyMembers.map((FamilyMember member) {
      return FamilyMemberRequest(
        // Update thì lấy id từ member, nếu khi tạo mới thì id sẽ là null
        id: member.isUpdate ? member.id : null,
        kyKeKhaiId: kyKeKhaiId,
        hoTen: member.fullName,
        maSoBhxh: member.bhxhNumber,
        ngaySinh: member.dateOfBirth,
        gioiTinh: member.gender.rawValue,
        danToc: member.ethnic.value.toString(),
        quocTich: member.nation.value,
        chiCoNamSinh: member.birthType.rawValue,
        khaiSinhTinhId: member.province.id,
        khaiSinhHuyenId: member.district.id,
        khaiSinhXaId: member.ward.id,
        moiQuanHe: member.relationship.value,
        cmnd: member.cccdNumber,
        ghiChu: member.note,
        laNguoiThamGia: member.isParticipant,
        isUpdate: member.isUpdate,
      );
    }).toList();
  }
}
