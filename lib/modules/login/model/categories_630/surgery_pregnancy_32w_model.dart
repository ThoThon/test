import 'package:equatable/equatable.dart';

/// Phẫu thuật hoặc thai dưới 32 tuần
class SurgeryPregnancy32wModel extends Equatable {
  final String value;
  final String text;

  const SurgeryPregnancy32wModel({
    required this.value,
    required this.text,
  });

  factory SurgeryPregnancy32wModel.fromJson(Map<String, dynamic> json) {
    return SurgeryPregnancy32wModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
