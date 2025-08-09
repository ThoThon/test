import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/shared/model/adjustment_plan_data.dart';

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
