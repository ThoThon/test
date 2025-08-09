import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Chỉ có năm sinh - Dùng cho tờ khai TK1 của thủ tục 607
class BirthType extends Equatable implements Entity {
  final String value;
  final String text;

  const BirthType({
    required this.value,
    required this.text,
  });

  factory BirthType.fromJson(Map<String, dynamic> json) {
    return BirthType(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
