import 'package:v_bhxh/clean/core/data/model/adjustment_plan_data.dart';
import 'package:v_bhxh/clean/core/domain/entity/adjustment_plan.dart';

import 'base/base_data_mapper.dart';

class AdjustmentPlanDataMapper
    extends BaseDataMapper<AdjustmentPlanData, AdjustmentPlan> {
  @override
  AdjustmentPlan mapToEntity(AdjustmentPlanData? data) {
    return AdjustmentPlan(
      id: data?.id ?? '',
      name: data?.name ?? '',
    );
  }
}
