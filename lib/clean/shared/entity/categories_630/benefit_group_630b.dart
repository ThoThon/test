import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

/// Mã nhóm hưởng của thủ tục 630 a,b,c

const benefitGroupSickChildValue = 'O2';

/// Mã nhóm hưởng 630b
class BenefitGroup630 extends Equatable implements Entity {
  final String value;
  final String text;
  final Set<BenefitGroupLv2> benefitGroupLv2;

  const BenefitGroup630({
    required this.value,
    required this.text,
    required this.benefitGroupLv2,
  });

  @Deprecated('Sử dụng BenefitGroup630Data để parse Json')
  factory BenefitGroup630.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
      benefitGroupLv2: json['maNhomHuong2s'] != null
          ? (json['maNhomHuong2s'] as List)
              .map((e) => BenefitGroupLv2.fromJson(e))
              .toSet()
          : <BenefitGroupLv2>{},
    );
  }

  @override
  List<Object?> get props => [value, text];
}
