import 'gender.dart';

class FamilyMember {
  /// Họ và tên
  final String fullName;

  /// Mã số bảo hiểm xã hội
  final String? bhxhNumber;

  /// Ngày sinh *
  final DateTime dateOfBirth;

  /// Giới tính *
  final Gender gender;

  /// Dân tộc *
  final String ethnic;

  /// Quốc tịch *
  final String nationality;

  /// Tỉnh khai sinh *
  final String province;

  /// Huyện khai sinh *
  final String district;

  /// Xã khai sinh
  final String ward;

  /// Mối quan hệ với chủ hộ *
  final String relationship;

  /// Là người tham gia
  final bool isParticipant;

  const FamilyMember({
    required this.fullName,
    this.bhxhNumber,
    required this.dateOfBirth,
    required this.gender,
    required this.ethnic,
    required this.nationality,
    required this.province,
    required this.district,
    required this.ward,
    required this.relationship,
    required this.isParticipant,
  });
}
