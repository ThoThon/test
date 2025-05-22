import 'package:equatable/equatable.dart';

/// Dân tộc
class EthnicModel extends Equatable {
  final String value;
  final String text;

  const EthnicModel({
    required this.value,
    required this.text,
  });

  factory EthnicModel.fromJson(Map<String, dynamic> json) {
    return EthnicModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
