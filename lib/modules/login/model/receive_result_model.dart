import 'package:equatable/equatable.dart';

/// Nhận kết quả hồ sơ - Dùng cho tờ khai TK1 của thủ tục 607
class ReceiveResultModel extends Equatable {
  final String value;
  final String text;

  const ReceiveResultModel({
    required this.value,
    required this.text,
  });

  factory ReceiveResultModel.fromJson(Map<String, dynamic> json) {
    return ReceiveResultModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
