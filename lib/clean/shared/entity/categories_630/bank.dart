import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

/// Ngân hàng
class Bank extends Equatable implements Entity {
  final int id;

  /// Mã tỉnh
  final String provinceCoe;

  /// Mã ngân hàng
  final String code;

  /// Tên ngân hàng
  final String name;

  const Bank({
    required this.id,
    required this.provinceCoe,
    required this.code,
    required this.name,
  });

  @Deprecated('Sử dụng BankData để parse Json')
  factory Bank.fromJson(Map<String, dynamic> json) {
    return Bank(
      id: json["id"] ?? 0,
      provinceCoe: json["maTinh"] ?? "",
      code: json["maNganHang"] ?? "",
      name: json["ciName"] ?? "",
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "maTinh": provinceCoe,
        "maNganHang": code,
        "ciName": name,
      };

  @override
  List<Object?> get props => [
        id,
        provinceCoe,
        code,
        name,
      ];
}
