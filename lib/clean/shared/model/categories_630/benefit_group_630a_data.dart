/// Mã nhóm hưởng 630a
class BenefitGroup630aData {
  final String? value;
  final String? text;

  const BenefitGroup630aData({
    this.value,
    this.text,
  });

  factory BenefitGroup630aData.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630aData(
      value: json['value'],
      text: json['text'],
    );
  }
}
