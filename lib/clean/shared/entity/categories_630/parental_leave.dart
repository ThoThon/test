import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Nghỉ chăm con
class ParentalLeave extends Equatable implements Entity {
  final String value;
  final String text;

  const ParentalLeave({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ParentalLeaveData để parse Json')
  factory ParentalLeave.fromJson(Map<String, dynamic> json) {
    return ParentalLeave(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
