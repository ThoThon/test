import 'adjustment_plan_data.dart';

/// Loại kê khai
class DeclarationTypeData {
  final int? value;
  final String? text;
  final Set<AdjustmentPlanData>? plans;

  const DeclarationTypeData({
    this.value,
    this.text,
    this.plans,
  });

  factory DeclarationTypeData.fromJson(Map<String, dynamic> json) {
    return DeclarationTypeData(
        value: json['value'],
        text: json['text'],
        plans: (json['phuongAns'] as List<dynamic>?)
            ?.map((e) => AdjustmentPlanData.fromJson(e))
            .toSet());
  }
}
