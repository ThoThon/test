import 'package:equatable/equatable.dart';
import 'package:v_bhxh/clean/core/domain/entity/entity.dart';
import 'package:v_bhxh/modules/login/model/receive_result_model.dart';

/// Nhận kết quả hồ sơ - Dùng cho tờ khai TK1 của thủ tục 607
class ReceiveResult extends Equatable implements Entity {
  final String value;
  final String text;

  const ReceiveResult({
    required this.value,
    required this.text,
  });

  @override
  List<Object?> get props => [value, text];

  // TODO: Xóa sau khi xóa bỏ hoàn toàn AppData
  ReceiveResultModel toOldModel() {
    return ReceiveResultModel(
      value: value,
      text: text,
    );
  }
}
