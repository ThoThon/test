import 'package:equatable/equatable.dart';

class RegisterReceiveResultModel extends Equatable {
  final String value;
  final String text;

  const RegisterReceiveResultModel({
    required this.value,
    required this.text,
  });

  factory RegisterReceiveResultModel.fromJson(Map<String, dynamic> json) {
    return RegisterReceiveResultModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
