import 'package:v_bhxh/clean/shared/model/categories_630/benefit_group_lv2_data.dart';

/// Mã nhóm hưởng 630b
class BenefitGroup630Data {
  final String? value;
  final String? text;
  final List<BenefitGroupLv2Data>? benefitGroupLv2;

  const BenefitGroup630Data({
    this.value,
    this.text,
    this.benefitGroupLv2,
  });

  factory BenefitGroup630Data.fromJson630a(Map<String, dynamic> json) {
    return BenefitGroup630Data(
      value: json['value'],
      text: json['text'],
    );
  }

  factory BenefitGroup630Data.fromJson630b(Map<String, dynamic> json) {
    return BenefitGroup630Data(
      value: json['value'],
      text: json['text'],
      benefitGroupLv2: (json['maNhomHuong2s'] as List?)
          ?.map((e) => BenefitGroupLv2Data.fromJson(e))
          .toList(),
    );
  }

  factory BenefitGroup630Data.fromJson630c(Map<String, dynamic> json) {
    return BenefitGroup630Data(
      value: json['value'],
      text: json['text'],
    );
  }
}
