import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/history_detail_register/model/result_lookup_history_register_model.dart';
import 'package:v_bhxh/modules/src.dart';

class HistoryDetailRegisterRepository extends BaseRepository {
  HistoryDetailRegisterRepository(super.controller);

  Future<BaseResponse<ResultLookupHistoryRegisterModel>> lookupHistoryRegister(
    String ma_tra_cuu,
  ) async {
    final response = await baseCallApi(
      AppApi.urlLookupHistoryRegister,
      EnumRequestMethod.get,
      jsonMap: {"ma_tra_cuu": ma_tra_cuu},
    );
    logger.d(response);
    return BaseResponse<ResultLookupHistoryRegisterModel>.fromJson(
      response,
      fromJson: (json) => ResultLookupHistoryRegisterModel.fromJson(json),
    );
  }
}
