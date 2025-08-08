import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/gender.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/birth_type_enum.dart';

class FamilyMemberEntity implements Entity {
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
  final DateTime dateOfBirth;

  /// Giới tính *
  final Gender gender;

  /// Dân tộc *
  final Ethnic ethnic;

  /// Quốc tịch *
  final Nation nation;

  /// Tỉnh khai sinh *
  final Province province;

  /// Huyện khai sinh *
  final District district;

  /// Xã khai sinh *
  final Ward ward;

  /// Mối quan hệ với chủ hộ *
  final Relationship relationship;

  /// Là người tham gia
  final bool isParticipant;

  final String? giaDinhId;

  final bool isUpdate;

  const FamilyMemberEntity({
    this.id,
    required this.fullName,
    required this.bhxhNumber,
    required this.cccdNumber,
    required this.note,
    required this.birthType,
    required this.dateOfBirth,
    required this.gender,
    required this.ethnic,
    required this.nation,
    required this.province,
    required this.district,
    required this.ward,
    required this.relationship,
    required this.isParticipant,
    this.giaDinhId,
    required this.isUpdate,
  });
}
