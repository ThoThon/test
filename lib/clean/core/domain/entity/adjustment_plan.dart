import 'package:equatable/equatable.dart';
import 'package:v_bhxh/modules/login/model/declaration_type_model.dart';

import 'base/entity.dart';

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
}
