import 'package:equatable/equatable.dart';

class DistrictModel extends Equatable {
  final String id;
  final String provinceId;
  final String name;

  const DistrictModel({
    required this.id,
    required this.provinceId,
    required this.name,
  });

  factory DistrictModel.fromJson(Map<String, dynamic> json) {
    return DistrictModel(
      id: json['maHuyen'] ?? '',
      provinceId: json['maTinh'] ?? '',
      name: json['tenHuyen'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, provinceId, name];
}
