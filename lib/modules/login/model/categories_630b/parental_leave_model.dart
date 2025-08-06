import 'package:equatable/equatable.dart';

/// Nghỉ chăm con
class ParentalLeaveModel extends Equatable {
  final String value;
  final String text;

  const ParentalLeaveModel({
    required this.value,
    required this.text,
  });

  factory ParentalLeaveModel.fromJson(Map<String, dynamic> json) {
    return ParentalLeaveModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
