import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history/data/model/register_history_list_request_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/register_history_list_request.dart';

class RegisterHistoryListRequestDataMapper extends BaseEntityMapper<
    RegisterHistoryListRequest, RegisterHistoryListRequestData> {
  @override
  RegisterHistoryListRequestData mapToData(RegisterHistoryListRequest entity) {
    return RegisterHistoryListRequestData(
      pageIndex: entity.pageIndex,
      pageSize: entity.pageSize,
      thang: entity.month,
      nam: entity.year,
      soHoSo: entity.dossierNumber,
      loaiGiaoDich: entity.transactionType,
    );
  }
}
