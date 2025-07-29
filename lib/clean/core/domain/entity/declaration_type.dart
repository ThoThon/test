import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/adjustment_plan.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

import 'base/entity.dart';

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

  @override
  List<Object?> get props => [value, text];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  DeclarationTypeModel toOldModel() {
    return DeclarationTypeModel(
      value: value,
      text: text,
      plans: plans.map((e) => e.toOldModel()).toSet(),
    );
  }
}
