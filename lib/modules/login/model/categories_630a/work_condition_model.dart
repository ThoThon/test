import 'package:equatable/equatable.dart';

/// Điều kiện làm việc
class WorkCondition630aModel extends Equatable {
  final String value;
  final String text;

  const WorkCondition630aModel({
    required this.value,
    required this.text,
  });

  factory WorkCondition630aModel.fromJson(Map<String, dynamic> json) {
    return WorkCondition630aModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
