import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';

/// Mã nhóm hưởng 630b
class BenefitGroup630bModel extends Equatable {
  final String value;
  final String text;
  final Set<BenefitGroupLv2Model> benefitGroupLv2;

  const BenefitGroup630bModel({
    required this.value,
    required this.text,
    required this.benefitGroupLv2,
  });

  @Deprecated('Sử dụng BenefitGroup630bData để parse Json')
  factory BenefitGroup630bModel.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630bModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
      benefitGroupLv2: json['maNhomHuong2s'] != null
          ? (json['maNhomHuong2s'] as List)
              .map((e) => BenefitGroupLv2Model.fromJson(e))
              .toSet()
          : <BenefitGroupLv2Model>{},
    );
  }

  @override
  List<Object?> get props => [value, text];
}
