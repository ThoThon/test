import 'package:equatable/equatable.dart';

/// Nhận kết quả hồ sơ - Dùng cho tờ khai TK1 của thủ tục 607
class ReceiveResult extends Equatable {
  final String value;
  final String text;

  const ReceiveResult({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];
}
