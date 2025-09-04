/// Biện pháp tránh thai
class ContraceptionData {
  final String? value;
  final String? text;

  const ContraceptionData({
    this.value,
    this.text,
  });

  factory ContraceptionData.fromJson(Map<String, dynamic> json) {
    return ContraceptionData(
      value: json['value'],
      text: json['text'],
    );
  }
}
