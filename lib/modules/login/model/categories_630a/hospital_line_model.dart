import 'package:equatable/equatable.dart';

/// Tuyến bệnh viện
class HospitalLine630aModel extends Equatable {
  final String value;
  final String text;

  const HospitalLine630aModel({
    required this.value,
    required this.text,
  });

  factory HospitalLine630aModel.fromJson(Map<String, dynamic> json) {
    return HospitalLine630aModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
