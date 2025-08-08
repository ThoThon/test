import 'package:v_bhxh/clean/shared/model/declaration_type_data.dart';
import 'package:v_bhxh/clean/shared/entity/adjustment_plan.dart';
import 'package:v_bhxh/clean/shared/entity/declaration_type.dart';
import 'package:v_bhxh/clean/shared/mapper/adjustment_plan_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/base/base_data_mapper.dart';

class DeclarationTypeDataMapper
    extends BaseDataMapper<DeclarationTypeData, DeclarationType> {
  final AdjustmentPlanDataMapper _adjustmentPlanDataMapper;

  const DeclarationTypeDataMapper(this._adjustmentPlanDataMapper);

  @override
  DeclarationType mapToEntity(DeclarationTypeData? data) {
    return DeclarationType(
      value: data?.value ?? 0,
      text: data?.text ?? '',
      plans: data?.plans
              ?.map((plan) => _adjustmentPlanDataMapper.mapToEntity(plan))
              .toSet() ??
          <AdjustmentPlan>{},
    );
  }
}
