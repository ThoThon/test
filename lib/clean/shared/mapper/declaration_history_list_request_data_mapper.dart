import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/declaration_history_list_request_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_list_request.dart';

class DeclarationHistoryListRequestDataMapper extends BaseEntityMapper<
    DeclarationHistoryListRequest, DeclarationHistoryListRequestData> {
  @override
  DeclarationHistoryListRequestData mapToData(
      DeclarationHistoryListRequest entity) {
    return DeclarationHistoryListRequestData(
      companyId: entity.companyId,
      maThuTuc: entity.maThuTuc,
      thang: entity.thang,
      nam: entity.nam,
      pageIndex: entity.pageIndex,
      pageSize: entity.pageSize,
      soHoSo: entity.soHoSo,
    );
  }
}
