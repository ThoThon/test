import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class Position extends Equatable implements Entity {
  final int id;
  final String name;

  const Position({
    required this.id,
    required this.name,
  });

  factory Position.fromJson(Map<String, dynamic> json) {
    return Position(
      id: json['id'] ?? 0,
      name: json['tenChucVu'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name];
}
