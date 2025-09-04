/// Bệnh dài ngày
class LongDieaseData {
  /// Key
  final String? id;

  /// Tên bệnh
  final String? name;

  /// Mã bệnh
  final String? code;

  const LongDieaseData({
    this.id,
    this.name,
    this.code,
  });

  factory LongDieaseData.fromJson(Map<String, dynamic> json) {
    return LongDieaseData(
      id: json["key"],
      name: json["tenBenh"],
      code: json["maBenh"],
    );
  }
}
