import 'package:equatable/equatable.dart';

class Hospital extends Equatable {
  final int id;
  final String name;
  final String code;
  final String provinceId;

  const Hospital({
    required this.id,
    required this.name,
    required this.code,
    required this.provinceId,
  });

  factory Hospital.fromJson(Map<String, dynamic> json) {
    return Hospital(
      id: json['id'] ?? 0,
      name: json['tenBenhVien'] ?? '',
      code: json['maBenhVien'] ?? '',
      provinceId: json['maTinh'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, code, provinceId];
}
