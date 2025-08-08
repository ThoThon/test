import 'package:equatable/equatable.dart';
import 'package:v_bhxh/modules/login/model/adjustment_plan_model.dart';
import 'package:v_bhxh/modules/login/model/declaration_type_model.dart';

import '../../core/domain/entity/entity.dart';

/// Phương án điều chỉnh
class AdjustmentPlan extends Equatable implements Entity {
  final String id;
  final String name;

  const AdjustmentPlan({
    required this.id,
    required this.name,
  });

  /// Tự động tick và bỏ tick chọn sinh tờ khai TK1-TS
  ///
  /// REF: http://10.100.140.19:8080/browse/BHW-2243
  bool isGenerateTk1(DeclarationTypeModel? declarationType) {
    // Tăng lao động
    if (declarationType?.value == 1) {
      return ["TM", "TC", "TD", "TH"].contains(id);
    }

    return false;
  }

  @override
  List<Object?> get props => [id, name];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  AdjustmentPlanModel toOldModel() {
    return AdjustmentPlanModel(
      id: id,
      name: name,
    );
  }
}
