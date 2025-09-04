import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Nghỉ dưỡng thai
class MaternityLeave extends Equatable implements Entity {
  final String value;
  final String text;

  const MaternityLeave({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng MaternityLeaveData để parse Json')
  factory MaternityLeave.fromJson(Map<String, dynamic> json) {
    return MaternityLeave(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
