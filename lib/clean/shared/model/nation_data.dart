/// Quốc gia
class NationData {
  final String? value;
  final String? text;

  const NationData({
    this.value,
    this.text,
  });

  factory NationData.fromJson(Map<String, dynamic> json) {
    return NationData(
      value: json['value'],
      text: json['text'],
    );
  }
}
