import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/core/values/const.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

// Key is provinceCode
final cachedDistricts = <String, List<DistrictModel>>{};

class DeclareInfoRepository extends BaseRepository {
  DeclareInfoRepository(super.controller);

  Future<BaseResponseList<DistrictModel>> getDistricts({
    required String provinceCode,
  }) async {
    if (cachedDistricts.containsKey(provinceCode)) {
      final districts = cachedDistricts[provinceCode];
      return BaseResponseList<DistrictModel>(
        code: AppConst.statusCodeSuccess,
        result: districts!,
        totalNumber: districts.length,
      );
    }

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
