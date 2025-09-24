import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/category.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/entity/staff_family_response_cl.dart';

import '../../../src.dart';

class SelectedStaffDetail implements Entity {
  final String? id;
  final String? fullName;
  final String? bhxhNumber;
  final String? cccdNumber;
  final int? gender;
  final int? onlyYearOfBirth;
  final String? dateOfBirth;
  final Category? ethnicity;
  final Category? nationality;
  final String? position;
  final bool basedOnCoefficient;
  final int? baseSalaryCoefficient;
  final int? salary;
  final int? positionAllowance;
  final int? seniorityBeyondFrameAllowance;
  final int? seniorityAllowance;
  final int? salaryAllowance;
  final int? additionalAllowance;
  final Province? hospitalProvince;
  final Hospital? hospital;
  final Province? birthProvince;
  final Ward? birthWard;
  final String? birthAddress;
  final Province? receivingProvince;
  final Ward? receivingWard;
  final String? receivingAddress;
  final String? contactPhone;
  final String? householdHeadName;
  final String? householdHeadIdentityCard;
  final Province? householdHeadPermanentProvince;
  final Ward? householdHeadPermanentWard;
  final String? householdHeadPermanentAddress;
  final bool sameAsBirthAddress;
  final bool isHouseholdHead;
  final String? contributionRate;
  final List<StaffFamilyResponseCl> familyMembers;

  const SelectedStaffDetail({
    this.id,
    this.fullName,
    this.bhxhNumber,
    this.cccdNumber,
    this.gender,
    this.onlyYearOfBirth,
    this.dateOfBirth,
    this.ethnicity,
    this.nationality,
    this.position,
    required this.basedOnCoefficient,
    this.baseSalaryCoefficient,
    this.salary,
    this.positionAllowance,
    this.seniorityBeyondFrameAllowance,
    this.seniorityAllowance,
    this.salaryAllowance,
    this.additionalAllowance,
    this.hospitalProvince,
    this.hospital,
    this.birthProvince,
    this.birthWard,
    this.birthAddress,
    this.receivingProvince,
    this.receivingWard,
    this.receivingAddress,
    this.contactPhone,
    this.householdHeadName,
    this.householdHeadIdentityCard,
    this.householdHeadPermanentProvince,
    this.householdHeadPermanentWard,
    this.householdHeadPermanentAddress,
    required this.sameAsBirthAddress,
    required this.isHouseholdHead,
    this.contributionRate,
    required this.familyMembers,
  });
}
