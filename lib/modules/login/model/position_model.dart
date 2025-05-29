import 'package:equatable/equatable.dart';

class PositionModel extends Equatable {
  final int id;
  final String name;

  const PositionModel({
    required this.id,
    required this.name,
  });

  factory PositionModel.fromJson(Map<String, dynamic> json) {
    return PositionModel(
      id: json['id'] ?? 0,
      name: json['tenChucVu'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}
