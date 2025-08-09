import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Tỉnh
class Province extends Equatable implements Entity {
  /// Mã tỉnh
  final String id;

  /// Tên tỉnh
  final String name;

  /// Mã hành chính
  final String code;

  const Province({
    required this.id,
    required this.name,
    required this.code,
  });

  factory Province.fromJson(Map<String, dynamic> json) {
    return Province(
      id: json['maTinh'] ?? '',
      name: json['tenTinh'] ?? '',
      code: json['maHanhChinh'] ?? '',
    );
  }

  @override
  List<Object?> get props => [id, name, code];
}
