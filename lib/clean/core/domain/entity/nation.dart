import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';

/// Quốc gia
class Nation extends Equatable implements Entity {
  final String value;
  final String text;

  const Nation({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];
}
