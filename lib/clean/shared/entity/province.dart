import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/login/model/province_model.dart';

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

  @override
  List<Object?> get props => [id, name, code];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  ProvinceModel toOldModel() {
    return ProvinceModel(
      id: id,
      name: name,
      code: code,
    );
  }
}
