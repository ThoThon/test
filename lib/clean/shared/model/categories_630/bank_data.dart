/// Ngân hàng
class BankData {
  final int? id;

  /// Mã tỉnh
  final String? provinceCoe;

  /// Mã ngân hàng
  final String? code;

  /// Tên ngân hàng
  final String? name;

  const BankData({
    this.id,
    this.provinceCoe,
    this.code,
    this.name,
  });

  factory BankData.fromJson(Map<String, dynamic> json) {
    return BankData(
      id: json["id"],
      provinceCoe: json["maTinh"],
      code: json["maNganHang"],
      name: json["ciName"],
    );
  }
}
