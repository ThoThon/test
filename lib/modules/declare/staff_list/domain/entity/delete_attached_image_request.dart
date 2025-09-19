import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class DeleteAttachedImageRequest implements Entity {
  final String periodId;
  final String fileName;

  DeleteAttachedImageRequest({
    required this.periodId,
    required this.fileName,
  });
}
