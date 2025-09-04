/// Điều kiện sinh con
class ChildBirthConditionData {
  final String? value;
  final String? text;

  const ChildBirthConditionData({
    required this.value,
    required this.text,
  });

  factory ChildBirthConditionData.fromJson(Map<String, dynamic> json) {
    return ChildBirthConditionData(
      value: json['value'],
      text: json['text'],
    );
  }
}
