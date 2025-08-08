import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/login/model/birth_type_model.dart';

/// Chỉ có năm sinh - Dùng cho tờ khai TK1 của thủ tục 607
class BirthType extends Equatable implements Entity {
  final String value;
  final String text;

  const BirthType({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  BirthTypeModel toOldModel() {
    return BirthTypeModel(
      value: value,
      text: text,
    );
  }
}
