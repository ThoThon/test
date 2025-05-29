import 'package:v_bhxh/modules/declare/declare_info/model/d02/d02_detail/member_detail_response.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

import 'birth_type_enum.dart';

class FamilyMember {
  /// ID thành viên gia đình - Gen với uuid
  final String? id;

  /// Họ và tên *
  final String fullName;

  /// Mã số bảo hiểm xã hội
  final String bhxhNumber;

  /// Số CMND/CCCD/HC
  final String cccdNumber;

  // Ghi chú
  final String note;

  /// Loại ngày sinh *
  final BirthTypeEnum birthType;

  /// Ngày sinh *
  final DateTime? dateOfBirth;

  /// Giới tính *
  final Gender gender;

  /// Dân tộc *
  final EthnicModel ethnic;

  /// Quốc tịch *
  final NationModel nation;

  /// Tỉnh khai sinh *
  final ProvinceModel province;

  /// Huyện khai sinh *
  final DistrictModel district;

  /// Xã khai sinh *
  final WardModel ward;

  /// Mối quan hệ với chủ hộ *
  final RelationshipModel relationship;

  /// Là người tham gia
  final bool isParticipant;

  final bool isUpdate;

  const FamilyMember({
    this.id,
    required this.fullName,
    required this.bhxhNumber,
    required this.cccdNumber,
    required this.note,
    required this.birthType,
    this.dateOfBirth,
    required this.gender,
    required this.ethnic,
    required this.nation,
    required this.province,
    required this.district,
    required this.ward,
    required this.relationship,
    required this.isParticipant,
    // Mặc định isUpdate là false khi tạo mới
    this.isUpdate = false,
  });

  factory FamilyMember.fromResponse(MemberDetailResponse member) {
    return FamilyMember(
      id: member.id,
      fullName: member.hoTen ?? '',
      bhxhNumber: member.maSoBhxh ?? '',
      cccdNumber: member.cmnd ?? '',
      note: member.ghiChu ?? '',
      birthType: member.chiCoNamSinh,
      dateOfBirth: member.ngaySinh,
      gender: member.gioiTinh,
      ethnic: member.danToc,
      nation: member.quocTich,
      province: member.khaiSinhTinh,
      district: member.khaiSinhHuyen,
      ward: member.khaiSinhXa,
      relationship: member.moiQuanHe,
      isParticipant: member.laNguoiThamGia,
      // Đọc từ response => đã có dữ liệu, isUpdate sẽ là true để cập nhật ở BE
      isUpdate: true,
    );
  }
}
