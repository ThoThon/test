import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';
import 'package:v_bhxh/modules/login/model/relationship_model.dart';

class Relationship extends Equatable implements Entity {
  final String value;
  final String text;

  const Relationship({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  RelationshipModel toOldModel() {
    return RelationshipModel(
      value: value,
      text: text,
    );
  }
}
