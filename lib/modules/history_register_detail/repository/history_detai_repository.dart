import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';

import '../../../base_app/base_app.src.dart';
import '../history_register_detail_src.dart';

class HistoryDetaiRepositoryICare extends BaseRepository {
  HistoryDetaiRepositoryICare(super.controller);

  Future<BaseResponseIcare<ProcessDocumentModel>> searchProcessDocument({
    required String key,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSearchProcessDocumentByKey,
      EnumRequestMethod.get,
      jsonMap: {"key": key},
    );
    return BaseResponseIcare<ProcessDocumentModel>.fromJson(
      response,
      fromJson: (json) => ProcessDocumentModel.fromJson(json),
    );
  }

  Future<BaseResponseIcare> updateHistoryRigister({
    required UpdateHistoryRigisterRequest request,
  }) async {
    final response = await baseCallApi(
      AppApi.urlUpdateHistoryRigister,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponseIcare.fromJson(
      response,
      fromJson: (json) => json,
    );
  }
}
