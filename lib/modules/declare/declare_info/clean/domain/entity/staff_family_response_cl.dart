import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/category.dart';

import '../../../../../../clean/shared/entity/entity_src.dart';
import '../../../../family_member_detail/domain/entity/entity_src.dart';
import '../../../model/gender.dart';

class StaffFamilyResponseCl implements Entity {
  final String? id;
  final String? fullName;
  final String? dateOfBirth;
  final Relationship relationship;
  final String? socialInsuranceNumber;
  final Gender gender;
  final Province? birthProvince;
  final Ward? birthWard;
  final String? identityCard;
  final BirthTypeEnum onlyYearOfBirth;
  final Category? nationality;
  final Category? ethnicity;

  const StaffFamilyResponseCl({
    this.id,
    this.fullName,
    this.dateOfBirth,
    required this.relationship,
    this.socialInsuranceNumber,
    required this.gender,
    this.birthProvince,
    this.birthWard,
    this.identityCard,
    required this.onlyYearOfBirth,
    this.nationality,
    this.ethnicity,
  });
}
