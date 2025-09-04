/// Nghỉ chăm con
class ParentalLeaveData {
  final String? value;
  final String? text;

  const ParentalLeaveData({
    this.value,
    this.text,
  });

  factory ParentalLeaveData.fromJson(Map<String, dynamic> json) {
    return ParentalLeaveData(
      value: json['value'],
      text: json['text'],
    );
  }
}
