import 'package:equatable/equatable.dart';

/// Mang thai hộ
class SurrogacyModel extends Equatable {
  final String value;
  final String text;

  const SurrogacyModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng SurrogacyData để parse Json')
  factory SurrogacyModel.fromJson(Map<String, dynamic> json) {
    return SurrogacyModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
