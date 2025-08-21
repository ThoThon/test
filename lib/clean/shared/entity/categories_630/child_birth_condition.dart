import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Điều kiện sinh con
class ChildBirthCondition extends Equatable implements Entity {
  final String value;
  final String text;

  const ChildBirthCondition({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ChildBirthConditionData để parse Json')
  factory ChildBirthCondition.fromJson(Map<String, dynamic> json) {
    return ChildBirthCondition(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
