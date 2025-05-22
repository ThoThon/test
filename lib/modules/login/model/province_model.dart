import 'package:equatable/equatable.dart';

/// Tỉnh
class ProvinceModel extends Equatable {
  /// Mã tỉnh
  final String id;

  /// Tên tỉnh
  final String name;

  /// Mã hành chính
  final String? code;

  const ProvinceModel({
    required this.id,
    required this.name,
    required this.code,
  });

  factory ProvinceModel.fromJson(Map<String, dynamic> json) {
    return ProvinceModel(
      id: json['maTinh'] ?? '',
      name: json['tenTinh'] ?? '',
      code: json['maHanhChinh'],
    );
  }

  @override
  List<Object?> get props => [id, name, code];
}
