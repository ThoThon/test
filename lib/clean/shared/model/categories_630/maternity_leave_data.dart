/// Nghỉ dưỡng thai
class MaternityLeaveData {
  final String? value;
  final String? text;

  const MaternityLeaveData({
    this.value,
    this.text,
  });

  factory MaternityLeaveData.fromJson(Map<String, dynamic> json) {
    return MaternityLeaveData(
      value: json['value'],
      text: json['text'],
    );
  }
}
