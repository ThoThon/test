import 'package:v_bhxh/clean/shared/model/categories_630/benefit_group_lv2_data.dart';

/// Mã nhóm hưởng 630b
class BenefitGroup630bData {
  final String? value;
  final String? text;
  final Set<BenefitGroupLv2Data>? benefitGroupLv2;

  const BenefitGroup630bData({
    this.value,
    this.text,
    this.benefitGroupLv2,
  });

  factory BenefitGroup630bData.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630bData(
      value: json['value'],
      text: json['text'],
      benefitGroupLv2: (json['maNhomHuong2s'] as List?)
          ?.map((e) => BenefitGroupLv2Data.fromJson(e))
          .toSet(),
    );
  }
}
