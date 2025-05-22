import 'package:equatable/equatable.dart';

/// Loại kê khai
class DeclarationTypeModel extends Equatable {
  final String value;
  final String text;

  const DeclarationTypeModel({
    required this.value,
    required this.text,
  });

  factory DeclarationTypeModel.fromJson(Map<String, dynamic> json) {
    return DeclarationTypeModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
