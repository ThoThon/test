/// Hình thức nhận
class ReceiveFormData {
  final String? value;
  final String? text;

  const ReceiveFormData({
    this.value,
    this.text,
  });

  factory ReceiveFormData.fromJson(Map<String, dynamic> json) {
    return ReceiveFormData(
      value: json['value'],
      text: json['text'],
    );
  }
}
