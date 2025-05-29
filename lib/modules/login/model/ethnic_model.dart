import 'package:equatable/equatable.dart';

/// Dân tộc
class EthnicModel extends Equatable {
  final int value;
  final String text;

  const EthnicModel({
    required this.value,
    required this.text,
  });

  factory EthnicModel.fromJson(Map<String, dynamic> json) {
    return EthnicModel(
      value: int.tryParse(json['value'].toString()) ?? 0,
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
