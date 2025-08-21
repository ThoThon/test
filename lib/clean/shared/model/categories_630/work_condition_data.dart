/// Điều kiện làm việc
class WorkConditionData {
  final String? value;
  final String? text;

  const WorkConditionData({
    this.value,
    this.text,
  });

  factory WorkConditionData.fromJson(Map<String, dynamic> json) {
    return WorkConditionData(
      value: json['value'],
      text: json['text'],
    );
  }
}
