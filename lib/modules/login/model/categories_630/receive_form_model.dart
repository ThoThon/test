import 'package:equatable/equatable.dart';

const ATMPaymentValue = 'ATM';

/// Hình thức nhận
class ReceiveFormModel extends Equatable {
  final String value;
  final String text;

  const ReceiveFormModel({
    required this.value,
    required this.text,
  });

  factory ReceiveFormModel.fromJson(Map<String, dynamic> json) {
    return ReceiveFormModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
