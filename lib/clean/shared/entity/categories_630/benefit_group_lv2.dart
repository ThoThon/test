import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Mã nhóm hưởng cấp 2
class BenefitGroupLv2 extends Equatable implements Entity {
  final String maNhomHuong;
  final String maNhomHuongC2;
  final String tenNhomHuongC2;

  const BenefitGroupLv2({
    required this.maNhomHuong,
    required this.maNhomHuongC2,
    required this.tenNhomHuongC2,
  });

  @Deprecated('Sử dụng BenefitGroupLv2Data để parse Json')
  factory BenefitGroupLv2.fromJson(Map<String, dynamic> json) {
    return BenefitGroupLv2(
      maNhomHuong: json['maNhomHuong'] ?? '',
      maNhomHuongC2: json['maNhomHuongC2'] ?? '',
      tenNhomHuongC2: json['tenNhomHuongC2'] ?? '',
    );
  }

  @override
  List<Object?> get props => [
        maNhomHuong,
        maNhomHuongC2,
        tenNhomHuongC2,
      ];
}

// REF: BHW-2964 và BHW-2963
const Set<String> requiredBirthAndCountChild = {
  // T4
  'T41', 'T42', 'T43', 'T44',

  // T6
  'T61', 'T62', 'T63',

  // T7
  'T71',

  // T8
  'T81', 'T82', 'T83',

  // T10
  'T101', 'T102', 'T103', 'T104', 'T105', 'T106',

  // T11
  'T111', 'T112', 'T113', 'T114', 'T115', 'T116', 'T117', 'T118',

  // T12
  'T121', 'T122', 'T123', 'T124', 'T125',

  // T13
  'T131',
};

// REF: BHW-2968
const Set<String> conditionRequiredAdoptionDate = {
  'T81',
  'T82',
  'T83',
  'T111',
  'T112',
  'T113',
  'T114',
  'T115',
  'T116',
  'T117',
  'T118',
};

// REF: 2967
const Set<String> requiredDateAndCountChildDeath = {
  'T61',
  'T62',
  'T63',
  'T104',
  'T105',
  'T106',
  'T114',
  'T115',
  'T116',
};

// REF: 2962
const Set<String> requiredPregnancyWeek = {
  'T21',
  'T22',
  'T23',
  'T24',
};
