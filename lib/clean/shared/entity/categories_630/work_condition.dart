import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Điều kiện làm việc
class WorkCondition extends Equatable implements Entity {
  final String value;
  final String text;

  const WorkCondition({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng WorkConditionData để parse Json')
  factory WorkCondition.fromJson(Map<String, dynamic> json) {
    return WorkCondition(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
