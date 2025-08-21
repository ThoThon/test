/// Điều kiện khám thai
class PregnancyCheckConditionData {
  final String? value;
  final String? text;

  const PregnancyCheckConditionData({
    this.value,
    this.text,
  });

  factory PregnancyCheckConditionData.fromJson(Map<String, dynamic> json) {
    return PregnancyCheckConditionData(
      value: json['value'],
      text: json['text'],
    );
  }
}
