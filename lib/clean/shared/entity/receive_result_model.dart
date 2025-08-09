import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Nhận kết quả hồ sơ - Dùng cho tờ khai TK1 của thủ tục 607
class ReceiveResult extends Equatable implements Entity {
  final String value;
  final String text;

  const ReceiveResult({
    required this.value,
    required this.text,
  });

  factory ReceiveResult.fromJson(Map<String, dynamic> json) {
    return ReceiveResult(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
