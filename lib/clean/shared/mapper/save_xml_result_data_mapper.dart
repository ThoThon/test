import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/staff_list/data/model/save_xml_result_data.dart';

import '../../../modules/declare/staff_list/domain/entity/entity_src.dart';

class SaveXmlResultDataMapper
    extends BaseDataMapper<SaveXmlResultData, SaveXmlResultCl> {
  final Tk1PreviewPathDataMapper _tk1previewPathDataMapper;
  SaveXmlResultDataMapper(this._tk1previewPathDataMapper);

  @override
  SaveXmlResultCl mapToEntity(SaveXmlResultData? data) {
    return SaveXmlResultCl(
      hasD01: data?.hasD01 ?? false,
      hasD02: data?.hasD02 ?? false,
      hasOdM01hsb: data?.hasOdM01hsb ?? false,
      hasTsM01hsb: data?.hasTsM01hsb ?? false,
      hasDsM01hsb: data?.hasDsM01hsb ?? false,
      attachPreviewPath: data?.attachPreviewPath,
      tk1s: _tk1previewPathDataMapper.mapToListEntity(data?.tk1s),
    );
  }
}
