import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Hình thức kê khai phát sinh
const declareMethodArisingValue = '1';

/// Hình thức kê khai điều chỉnh
const declareMethodAdjustValue = '2';

/// Hình thức kê khai
class DeclareForm630 extends Equatable implements Entity {
  final String value;
  final String text;

  const DeclareForm630({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng DeclareForm630Data để parse Json')
  factory DeclareForm630.fromJson(Map<String, dynamic> json) {
    return DeclareForm630(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
