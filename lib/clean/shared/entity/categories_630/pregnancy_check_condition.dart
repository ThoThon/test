import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Điều kiện khám thai
class PregnancyCheckCondition extends Equatable implements Entity {
  final String value;
  final String text;

  const PregnancyCheckCondition({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng PregnancyCheckConditionData để parse Json')
  factory PregnancyCheckCondition.fromJson(Map<String, dynamic> json) {
    return PregnancyCheckCondition(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
