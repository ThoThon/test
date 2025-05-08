import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';

class HistoryTransactionRepository extends BaseRepository {
  HistoryTransactionRepository(super.controller);

  Future<BaseResponseListIcare<HistoryRegisterModel>> getHistoryRegister(
      String idCompany) async {
    final response = await baseCallApi(
      AppApi.urlGetHistoryRegister,
      EnumRequestMethod.get,
      isHaveVersion: false,
      jsonMap: {
        "idCompany": idCompany,
      },
    );

    return BaseResponseListIcare<HistoryRegisterModel>.fromJson(
      response,
      HistoryRegisterModel.fromJson,
    );
  }
}
