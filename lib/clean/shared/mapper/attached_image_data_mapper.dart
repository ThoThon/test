import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/attached_image_data.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/attached_image.dart';

class AttachedImageDataMapper
    extends BaseDataMapper<AttachedImageData, AttachedImage> {
  @override
  AttachedImage mapToEntity(AttachedImageData? data) {
    return AttachedImage(
      fileName: data?.fileName ?? '',
      imgPath: data?.imgPath ?? '',
    );
  }
}
