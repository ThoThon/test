import 'package:equatable/equatable.dart';

import 'adjustment_plan_model.dart';

/// Loại kê khai
class DeclarationTypeModel extends Equatable {
  final int value;
  final String text;
  final Set<AdjustmentPlanModel> plans;

  const DeclarationTypeModel({
    required this.value,
    required this.text,
    required this.plans,
  });

  factory DeclarationTypeModel.fromJson(Map<String, dynamic> json) {
    return DeclarationTypeModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
      plans: json['phuongAns'] != null
          ? (json['phuongAns'] as List)
              .map((e) => AdjustmentPlanModel.fromJson(e))
              .toSet()
          : <AdjustmentPlanModel>{},
    );
  }

  @override
  List<Object?> get props => [value, text];
}
