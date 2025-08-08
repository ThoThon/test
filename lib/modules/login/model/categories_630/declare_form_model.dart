import 'package:equatable/equatable.dart';

/// Hình thức kê khai phát sinh
const declareMethodArisingValue = '1';

/// Hình thức kê khai điều chỉnh
const declareMethodAdjustValue = '2';

/// Hình thức kê khai
class DeclareForm630Model extends Equatable {
  final String value;
  final String text;

  const DeclareForm630Model({
    required this.value,
    required this.text,
  });

  factory DeclareForm630Model.fromJson(Map<String, dynamic> json) {
    return DeclareForm630Model(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
