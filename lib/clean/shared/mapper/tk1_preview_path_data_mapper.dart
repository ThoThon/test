import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/tk1_preview_path_data.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/entity_src.dart';

class Tk1PreviewPathDataMapper
    extends BaseDataMapper<Tk1PreviewPathData, Tk1PreviewPath> {
  @override
  Tk1PreviewPath mapToEntity(Tk1PreviewPathData? data) {
    return Tk1PreviewPath(
      documentRecordId: data?.documentRecordId ?? '',
      name: data?.hoTen ?? '',
    );
  }
}
