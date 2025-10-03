import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/regsister_history_list_data.dart';

import '../../../modules/history/domain/entity/register_history_list.dart';
import 'register_history_item_data_mapper.dart';

class RegisterHistoryListDataMapper
    extends BaseDataMapper<RegisterHistoryListData, RegisterHistoryList> {
  final RegisterHistoryItemDataMapper _registerHistoryItemDataMapper;

  RegisterHistoryListDataMapper(this._registerHistoryItemDataMapper);
  @override
  RegisterHistoryList mapToEntity(RegisterHistoryListData? data) {
    return RegisterHistoryList(
      historyResults:
          _registerHistoryItemDataMapper.mapToListEntity(data?.historyResults),
      totalCount: data?.totalCount ?? 0,
    );
  }
}
