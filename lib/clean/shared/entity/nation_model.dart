import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Quốc gia
class Nation extends Equatable implements Entity {
  final String value;
  final String text;

  const Nation({
    required this.value,
    required this.text,
  });

  factory Nation.fromJson(Map<String, dynamic> json) {
    return Nation(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
