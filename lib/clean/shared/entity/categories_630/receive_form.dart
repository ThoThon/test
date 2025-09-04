import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

const ATMPaymentValue = 'ATM';

/// Hình thức nhận
class ReceiveForm extends Equatable implements Entity {
  final String value;
  final String text;

  const ReceiveForm({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ReceiveFormData để parse Json')
  factory ReceiveForm.fromJson(Map<String, dynamic> json) {
    return ReceiveForm(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
