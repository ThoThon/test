import 'package:equatable/equatable.dart';

/// Điều kiện làm việc
class WorkConditionModel extends Equatable {
  final String value;
  final String text;

  const WorkConditionModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng WorkConditionData để parse Json')
  factory WorkConditionModel.fromJson(Map<String, dynamic> json) {
    return WorkConditionModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
