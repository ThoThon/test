import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

import 'adjustment_plan_model.dart';

/// Loại kê khai
class DeclarationType extends Equatable implements Entity {
  final int value;
  final String text;
  final Set<AdjustmentPlan> plans;

  const DeclarationType({
    required this.value,
    required this.text,
    required this.plans,
  });

  factory DeclarationType.fromJson(Map<String, dynamic> json) {
    return DeclarationType(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
      plans: json['phuongAns'] != null
          ? (json['phuongAns'] as List)
              .map((e) => AdjustmentPlan.fromJson(e))
              .toSet()
          : <AdjustmentPlan>{},
    );
  }

  @override
  List<Object?> get props => [value, text];
}
