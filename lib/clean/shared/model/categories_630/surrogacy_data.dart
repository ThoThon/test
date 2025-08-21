/// Mang thai hộ
class SurrogacyData {
  final String? value;
  final String? text;

  const SurrogacyData({
    this.value,
    this.text,
  });

  factory SurrogacyData.fromJson(Map<String, dynamic> json) {
    return SurrogacyData(
      value: json['value'],
      text: json['text'],
    );
  }
}
