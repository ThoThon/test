import '../../../base_app/base_app.src.dart';
import '../../src.dart';

class HistoryDetaiRepository extends BaseRepository {
  HistoryDetaiRepository(super.controller);

  Future<BaseResponse<FileNumberModel>> getFileNumber(String key) async {
    final response = await baseCallApi(
      AppApi.urlGetFileNumber,
      EnumRequestMethod.get,
      jsonMap: {'key': key},
    );
    return BaseResponse<FileNumberModel>.fromJson(
      response,
      fromJson: (json) => FileNumberModel.fromJson(json),
    );
  }

  Future<BaseResponse<ResultLookupHistoryModel>> lookupProcessHistory(
      String soHoSo) async {
    final response = await baseCallApi(
      AppApi.urlLookupProgressHistory,
      EnumRequestMethod.get,
      jsonMap: {"soHoSo": soHoSo},
    );
    return BaseResponse<ResultLookupHistoryModel>.fromJson(
      response,
      fromJson: (json) => ResultLookupHistoryModel.fromJson(json),
    );
  }
}
