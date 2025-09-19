import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class AttachedImage implements Entity{
  final String fileName;
  final String imgPath;

  AttachedImage({
    required this.fileName,
    required this.imgPath,
  });
}
