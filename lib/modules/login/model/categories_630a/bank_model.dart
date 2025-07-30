import 'package:equatable/equatable.dart';

/// Ngân hàng
class Bank630aModel extends Equatable {
  final int id;

  /// Mã tỉnh
  final String provinceCoe;

  /// Mã ngân hàng
  final String code;

  /// Tên ngân hàng
  final String name;

  const Bank630aModel({
    required this.id,
    required this.provinceCoe,
    required this.code,
    required this.name,
  });

  factory Bank630aModel.fromJson(Map<String, dynamic> json) {
    return Bank630aModel(
      id: json["id"] ?? "",
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
