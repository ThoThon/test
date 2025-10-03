import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/declaration_history_list_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_list.dart';

class DeclarationHistoryListDataMapper
    extends BaseDataMapper<DeclarationHistoryListData, DeclarationHistoryList> {
  final DeclarationHistoryItemDataMapper _declarationHistoryItemDataMapper;

  DeclarationHistoryListDataMapper(this._declarationHistoryItemDataMapper);
  @override
  DeclarationHistoryList mapToEntity(DeclarationHistoryListData? data) {
    return DeclarationHistoryList(
      historyResults: _declarationHistoryItemDataMapper
          .mapToListEntity(data?.historyResults),
      totalCount: data?.totalCount ?? 0,
    );
  }
}
