import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

class DeclareInfoRepository extends BaseRepository {
  DeclareInfoRepository(super.controller);

  Future<BaseResponseList<DistrictModel>> getDistricts({
    required String provinceCode,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetDistricts,
      EnumRequestMethod.get,
      jsonMap: {
        "provinceCode": provinceCode,
      },
    );
    return BaseResponseList<DistrictModel>.fromJson(
      response,
      (json) => DistrictModel.fromJson(json),
    );
  }
}
