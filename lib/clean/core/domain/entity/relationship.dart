import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';

class Relationship extends Equatable implements Entity {
  final String value;
  final String text;

  const Relationship({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];
}
