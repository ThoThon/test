import 'package:equatable/equatable.dart';

const benefitGroupSickChildValue = 'O2';

/// Mã nhóm hưởng
class BenefitGroup630aModel extends Equatable {
  final String value;
  final String text;

  const BenefitGroup630aModel({
    required this.value,
    required this.text,
  });

  factory BenefitGroup630aModel.fromJson(Map<String, dynamic> json) {
    return BenefitGroup630aModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
