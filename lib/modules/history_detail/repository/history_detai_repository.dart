import '../../../base_app/base_app.src.dart';
import '../../src.dart';

class HistoryDetaiRepository extends BaseRepository {
  HistoryDetaiRepository(super.controller);

  // Future<BaseResponse<ProcessDocumentModel>> searchProcessDocument({
  //   required String key,
  // }) async {
  //   final response = await baseCallApi(
  //     AppApi.urlSearchProcessDocumentByKey,
  //     EnumRequestMethod.get,
  //     jsonMap: {"key": key},
  //   );
  //   return BaseResponse<ProcessDocumentModel>.fromJson(
  //     response,
  //     fromJson: (json) => ProcessDocumentModel.fromJson(json),
  //   );
  // }

  // Future<BaseResponse> updateHistoryRigister({
  //   required UpdateHistoryRigisterRequest request,
  // }) async {
  //   final response = await baseCallApi(
  //     AppApi.urlUpdateHistoryRigister,
  //     EnumRequestMethod.post,
  //     jsonMap: request.toJson(),
  //   );
  //   return BaseResponse.fromJson(
  //     response,
  //     fromJson: (json) => json,
  //   );
  // }

  Future<BaseResponse<FileNumberModel>> getFileNumber(String key) async {
    final response = await baseCallApi(
      AppApi.urlGetFileNumber,
      EnumRequestMethod.get,
      jsonMap: {'key': key},
    );
    logger.d(response);
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
    logger.d(response);
    return BaseResponse<ResultLookupHistoryModel>.fromJson(
      response,
      fromJson: (json) => ResultLookupHistoryModel.fromJson(json),
    );
  }
}
