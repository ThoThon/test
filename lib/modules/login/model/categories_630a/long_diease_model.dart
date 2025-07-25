import 'package:equatable/equatable.dart';

/// Bệnh dài ngày
class LongDiease630aModel extends Equatable {
  /// Key
  final String id;

  /// Tên bệnh
  final String name;

  /// Mã bệnh
  final String code;

  const LongDiease630aModel({
    required this.id,
    required this.name,
    required this.code,
  });
  factory LongDiease630aModel.fromJson(Map<String, dynamic> json) {
    return LongDiease630aModel(
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
