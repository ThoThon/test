import 'package:equatable/equatable.dart';

/// Tuyến bệnh viện
class HospitalLineModel extends Equatable {
  final String value;
  final String text;

  const HospitalLineModel({
    required this.value,
    required this.text,
  });

  @Deprecated('Sử dụng HospitalLineData để parse Json')
  factory HospitalLineModel.fromJson(Map<String, dynamic> json) {
    return HospitalLineModel(
      value: json['value'] ?? '',
      text: json['text'] ?? '',
    );
  }

  @override
  List<Object?> get props => [value, text];
}
