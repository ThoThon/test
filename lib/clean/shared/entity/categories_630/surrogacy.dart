import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Mang thai hộ
class Surrogacy extends Equatable implements Entity {
  final String value;
  final String text;

  const Surrogacy({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng SurrogacyData để parse Json')
  factory Surrogacy.fromJson(Map<String, dynamic> json) {
    return Surrogacy(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
