import 'package:equatable/equatable.dart';

/// Bệnh dài ngày
class LongDieaseModel extends Equatable {
  /// Key
  final String id;

  /// Tên bệnh
  final String name;

  /// Mã bệnh
  final String code;

  const LongDieaseModel({
    required this.id,
    required this.name,
    required this.code,
  });

  @Deprecated('Sử dụng LongDieaseData để parse Json')
  factory LongDieaseModel.fromJson(Map<String, dynamic> json) {
    return LongDieaseModel(
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
