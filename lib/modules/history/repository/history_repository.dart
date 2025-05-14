import '../../../base_app/base_app.src.dart';
import '../../src.dart';
import '../models/model_src.dart';

class HistoryRepository extends BaseRepository {
  HistoryRepository(super.controller);

  Future<BaseResponse<HistoryResponse>> getHistory(
      HistoryRequest request) async {
    final response = await baseCallApi(
      AppApi.urlGetHistory,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    logger.d(request);
    logger.d(response);
    return BaseResponse<HistoryResponse>.fromJson(
      response,
      fromJson: (json) => HistoryResponse.fromJson(json),
    );
  }
}
