import 'package:equatable/equatable.dart';

class ReceiveMethodModel extends Equatable {
  final String value;
  final String text;

  const ReceiveMethodModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng ReceiveMethodData để parse Json')
  factory ReceiveMethodModel.fromJson(Map<String, dynamic> json) {
    return ReceiveMethodModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
