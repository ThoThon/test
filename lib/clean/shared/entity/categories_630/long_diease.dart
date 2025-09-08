import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Bệnh dài ngày
class LongDiease extends Equatable implements Entity {
  /// Key
  final String id;

  /// Tên bệnh
  final String name;

  /// Mã bệnh
  final String code;

  const LongDiease({
    required this.id,
    required this.name,
    required this.code,
  });

  @Deprecated('Sử dụng LongDieaseData để parse Json')
  factory LongDiease.fromJson(Map<String, dynamic> json) {
    return LongDiease(
      id: json["key"] ?? "",
      name: json["tenBenh"] ?? "",
      code: json["maBenh"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "key": id,
        "tenBenh": name,
        "maBenh": code,
      };

  @override
  List<Object?> get props => [id, name, code];
}
