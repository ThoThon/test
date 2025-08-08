import 'package:equatable/equatable.dart';

/// Mã nhóm hưởng 630b
class BenefitGroup630bModel extends Equatable {
  final String value;
  final String text;

  const BenefitGroup630bModel({
    required this.value,
    required this.text,
  });

  factory BenefitGroup630bModel.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630bModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
