class ReceiveMethodModel {
  final String value;
  final String text;

  const ReceiveMethodModel({
    required this.value,
    required this.text,
  });

  factory ReceiveMethodModel.fromJson(Map<String, dynamic> json) {
    return ReceiveMethodModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }
}
