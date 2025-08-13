import 'package:equatable/equatable.dart';

/// Nghỉ dưỡng thai
class MaternityLeaveModel extends Equatable {
  final String value;
  final String text;

  const MaternityLeaveModel({
    required this.value,
    required this.text,
  });

  factory MaternityLeaveModel.fromJson(Map<String, dynamic> json) {
    return MaternityLeaveModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}