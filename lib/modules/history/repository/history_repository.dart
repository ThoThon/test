import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/history/models/result_model.dart';

import '../../src.dart';

class HistoryRepository extends BaseRepository {
  HistoryRepository(super.controller);

  Future<BaseResponse<ResultModel>> getHistory() async {
    // var request = HistoryRequest(
    //   pageIndex: 1,
    //   pageSize: 15,
    //   thang: "",
    //   nam: "",
    //   maThuTuc: "",
    //   soHoSo: "",
    // );
    final response = await baseCallApi(
      AppApi.urlGetHistory,
      EnumRequestMethod.get,
      jsonMap: {
        "pageIndex": 1,
        "pageSize": 15,
        "thang": "",
        "nam": "",
        "maThuTuc": "",
        "soHoSo": "",
      },
    );
    logger.d(response);
    return BaseResponse<ResultModel>.fromJson(
      response,
      fromJson: (json) => ResultModel.fromJson(json),
    );
  }
}
