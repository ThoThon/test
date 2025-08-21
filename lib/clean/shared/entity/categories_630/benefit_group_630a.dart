import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

const benefitGroupSickChildValue = 'O2';

/// Mã nhóm hưởng 630a
class BenefitGroup630a extends Equatable implements Entity {
  final String value;
  final String text;

  const BenefitGroup630a({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng BenefitGroup630aData để parse Json')
  factory BenefitGroup630a.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630a(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
