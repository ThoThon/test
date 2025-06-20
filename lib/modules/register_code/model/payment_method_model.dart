class PaymentMethodModel {
  final String value;
  final String text;

  const PaymentMethodModel({
    required this.value,
    required this.text,
  });

  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }
}
