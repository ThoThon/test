import 'package:equatable/equatable.dart';

/// Ngân hàng
class BankModel extends Equatable {
  final int id;

  /// Mã tỉnh
  final String provinceCoe;

  /// Mã ngân hàng
  final String code;

  /// Tên ngân hàng
  final String name;

  const BankModel({
    required this.id,
    required this.provinceCoe,
    required this.code,
    required this.name,
  });

  @Deprecated('Sử dụng BankData để parse Json')
  factory BankModel.fromJson(Map<String, dynamic> json) {
    return BankModel(
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
