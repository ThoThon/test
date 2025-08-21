import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Phẫu thuật hoặc thai dưới 32 tuần
class SurgeryPregnancy32w extends Equatable implements Entity {
  final String value;
  final String text;

  const SurgeryPregnancy32w({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng SurgeryPregnancy32wData để parse Json')
  factory SurgeryPregnancy32w.fromJson(Map<String, dynamic> json) {
    return SurgeryPregnancy32w(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
