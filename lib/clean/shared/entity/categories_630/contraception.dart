import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Biện pháp tránh thai
class Contraception extends Equatable implements Entity {
  final String value;
  final String text;

  const Contraception({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ContraceptionData để parse Json')
  factory Contraception.fromJson(Map<String, dynamic> json) {
    return Contraception(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
