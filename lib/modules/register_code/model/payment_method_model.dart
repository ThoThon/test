import 'package:equatable/equatable.dart';

class PaymentMethodModel extends Equatable {
  final String value;
  final String text;

  const PaymentMethodModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng PaymentMethodData để parse Json')
  factory PaymentMethodModel.fromJson(Map<String, dynamic> json) {
    return PaymentMethodModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
