import 'package:equatable/equatable.dart';

/// Biện pháp tránh thai
class ContraceptionModel extends Equatable {
  final String value;
  final String text;

  const ContraceptionModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ContraceptionData để parse Json')
  factory ContraceptionModel.fromJson(Map<String, dynamic> json) {
    return ContraceptionModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
