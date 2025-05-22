import 'package:equatable/equatable.dart';

class AdjustmentPlanModel extends Equatable {
  final int id;
  final String code;
  final String name;
  final int declarationType1;
  final int declarationType2;
  final int declarationType3;

  const AdjustmentPlanModel({
    required this.id,
    required this.code,
    required this.name,
    required this.declarationType1,
    required this.declarationType2,
    required this.declarationType3,
  });

  factory AdjustmentPlanModel.fromJson(Map<String, dynamic> json) {
    return AdjustmentPlanModel(
      id: json['id'] ?? 0,
      code: json['code'] ?? '',
      name: json['name'] ?? '',
      declarationType1: json['declarationType1'] ?? 0,
      declarationType2: json['declarationType2'] ?? 0,
      declarationType3: json['declarationType3'] ?? 0,
    );
  }

  @override
  List<Object?> get props => [
        id,
        code,
        name,
        declarationType1,
        declarationType2,
        declarationType3,
      ];
}
