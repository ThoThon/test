import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/staff_info_data_mapper.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../modules/history/data/model/declaration_history_record_list_data.dart';

class DeclarationHistoryRecordListDataMapper extends BaseDataMapper<
    DeclarationHistoryRecordListData, DeclarationHistoryRecordList> {
  final StaffInfoDataMapper _staffInfoDataMapper;
  DeclarationHistoryRecordListDataMapper(this._staffInfoDataMapper);

  @override
  DeclarationHistoryRecordList mapToEntity(
      DeclarationHistoryRecordListData? data) {
    return DeclarationHistoryRecordList(
      hasD01: data?.hasD01 ?? false,
      d01Id: data?.d01Id,
      hasD02: data?.hasD02 ?? false,
      d02Id: data?.d02Id,
      hasTk1: data?.hasTk1 ?? false,
      tk1Id: data?.tk1Id,
      hasOdM01hsb: data?.hasOdM01hsb ?? false,
      odM01hsbId: data?.odM01hsbId,
      hasTsM01hsb: data?.hasTsM01hsb ?? false,
      tsM01hsbId: data?.tsM01hsbId,
      hasDsM01hsb: data?.hasDsM01hsb ?? false,
      dsM01hsbId: data?.dsM01hsbId,
      hasAttachFile: data?.hasAttachFile ?? false,
      attachPreviewPath: data?.attachPreviewPath,
      staffs: _staffInfoDataMapper.mapToListEntity(data?.staffs),
    );
  }
}
