import 'package:equatable/equatable.dart';

/// Điều kiện khám thai
class PregnancyCheckConditionModel extends Equatable {
  final String value;
  final String text;

  const PregnancyCheckConditionModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng PregnancyCheckConditionData để parse Json')
  factory PregnancyCheckConditionModel.fromJson(Map<String, dynamic> json) {
    return PregnancyCheckConditionModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
