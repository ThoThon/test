import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

/// Mã nhóm hưởng của thủ tục 630 a,b,c

const benefitGroupSickChildValue = 'O2';

/// Mã nhóm hưởng 630
class BenefitGroup630 extends Equatable implements Entity {
  final String value;
  final String text;
  final Set<BenefitGroupLv2> benefitGroupLv2;

  const BenefitGroup630({
    required this.value,
    required this.text,
    required this.benefitGroupLv2,
  });

  @override
  List<Object?> get props => [value, text];
}
