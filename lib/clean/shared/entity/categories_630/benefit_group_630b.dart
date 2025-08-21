import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

/// Mã nhóm hưởng 630b
class BenefitGroup630b extends Equatable implements Entity {
  final String value;
  final String text;
  final Set<BenefitGroupLv2> benefitGroupLv2;

  const BenefitGroup630b({
    required this.value,
    required this.text,
    required this.benefitGroupLv2,
  });

  @Deprecated('Sử dụng BenefitGroup630bData để parse Json')
  factory BenefitGroup630b.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630b(
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
