import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';
import 'package:v_bhxh/modules/login/model/position_model.dart';

class Position extends Equatable implements Entity {
  final int id;
  final String name;

  const Position({
    required this.id,
    required this.name,
  });

  @override
  List<Object?> get props => [id, name];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  PositionModel toOldModel() {
    return PositionModel(
      id: id,
      name: name,
    );
  }
}
