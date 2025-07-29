import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/base/entity.dart';
import 'package:v_bhxh/modules/login/model/nation_model.dart';

/// Quốc gia
class Nation extends Equatable implements Entity {
  final String value;
  final String text;

  const Nation({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  NationModel toOldModel() {
    return NationModel(
      value: value,
      text: text,
    );
  }
}
