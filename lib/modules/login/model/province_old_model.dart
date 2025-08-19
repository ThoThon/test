import 'package:equatable/equatable.dart';

/// Tỉnh cũ trước khi sáp nhập
class ProvinceOldModel extends Equatable {
  /// Mã tỉnh
  final String id;

  /// Tên tỉnh
  final String name;

  /// Mã hành chính
  final String code;

  const ProvinceOldModel({
    required this.id,
    required this.name,
    required this.code,
  });

  factory ProvinceOldModel.fromJson(Map<String, dynamic> json) {
    return ProvinceOldModel(
      id: json['maTinh'] ?? '',
      name: json['tenTinh'] ?? '',
      code: json['maHanhChinh'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, code];
}
