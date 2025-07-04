import 'package:equatable/equatable.dart';

/// Chỉ có năm sinh - Dùng cho tờ khai TK1 của thủ tục 607
class BirthTypeModel extends Equatable {
  final String value;
  final String text;

  const BirthTypeModel({
    required this.value,
    required this.text,
  });

  factory BirthTypeModel.fromJson(Map<String, dynamic> json) {
    return BirthTypeModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
