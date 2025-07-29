import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';
import 'package:v_bhxh/modules/login/model/ethnic_model.dart';

/// Dân tộc
class Ethnic extends Equatable implements Entity {
  final int value;
  final String text;

  const Ethnic({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  EthnicModel toOldModel() {
    return EthnicModel(
      value: value,
      text: text,
    );
  }
}
