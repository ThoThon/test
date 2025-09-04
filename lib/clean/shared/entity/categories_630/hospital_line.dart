import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Tuyến bệnh viện
class HospitalLine extends Equatable implements Entity {
  final String value;
  final String text;

  const HospitalLine({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng HospitalLineData để parse Json')
  factory HospitalLine.fromJson(Map<String, dynamic> json) {
    return HospitalLine(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
