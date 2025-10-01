import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

// Dùng để lấy về Số hồ sơ
class FileNumber implements Entity {
  final String code;
  final String status;
  final String timeReceived;
  final String recordNumber;

  FileNumber({
    required this.code,
    required this.status,
    required this.timeReceived,
    required this.recordNumber,
  });
}
