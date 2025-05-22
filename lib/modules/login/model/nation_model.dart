import 'package:equatable/equatable.dart';

/// Quốc gia
class NationModel extends Equatable {
  final String value;
  final String text;

  const NationModel({
    required this.value,
    required this.text,
  });

  factory NationModel.fromJson(Map<String, dynamic> json) {
    return NationModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
