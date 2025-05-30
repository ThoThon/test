import 'package:equatable/equatable.dart';
import 'package:v_bhxh/modules/login/model/declaration_type_model.dart';

class AdjustmentPlanModel extends Equatable {
  final String id;
  final String name;

  const AdjustmentPlanModel({
    required this.id,
    required this.name,
  });

  factory AdjustmentPlanModel.fromJson(Map<String, dynamic> json) {
    return AdjustmentPlanModel(
      id: json['maPhuongAn'] ?? '',
      name: json['tenPhuongAn'] ?? '',
    );
  }

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
  List<Object?> get props => [
        id,
        name,
      ];
}
