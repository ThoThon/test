import 'package:equatable/equatable.dart';

/// Hình thức nhận
class ReceiveForm630aModel extends Equatable {
  final String value;
  final String text;

  const ReceiveForm630aModel({
    required this.value,
    required this.text,
  });

  factory ReceiveForm630aModel.fromJson(Map<String, dynamic> json) {
    return ReceiveForm630aModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
