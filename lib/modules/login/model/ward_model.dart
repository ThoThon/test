import 'package:equatable/equatable.dart';

class WardModel extends Equatable {
  final String id;
  final String provinceId;
  final String districtId;
  final String name;

  const WardModel({
    required this.id,
    required this.provinceId,
    required this.districtId,
    required this.name,
  });

  factory WardModel.fromJson(Map<String, dynamic> json) {
    return WardModel(
      id: json['maXa'] ?? '',
      provinceId: json['maTinh'] ?? '',
      districtId: json['maHuyen'] ?? '',
      name: json['tenXa'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, provinceId, districtId, name];
}
