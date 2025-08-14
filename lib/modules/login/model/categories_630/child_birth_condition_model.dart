import 'package:equatable/equatable.dart';

/// Điều kiện sinh con
class ChildBirthConditionModel extends Equatable {
  final String value;
  final String text;

  const ChildBirthConditionModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ChildBirthConditionData để parse Json')
  factory ChildBirthConditionModel.fromJson(Map<String, dynamic> json) {
    return ChildBirthConditionModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
