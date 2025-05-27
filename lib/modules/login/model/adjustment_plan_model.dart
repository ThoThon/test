import 'package:equatable/equatable.dart';

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

  @override
  List<Object?> get props => [
        id,
        name,
      ];
}
