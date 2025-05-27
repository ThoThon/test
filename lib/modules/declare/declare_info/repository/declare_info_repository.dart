import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/core/values/const.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';

// Key is provinceCode
final cachedDistricts = <String, List<DistrictModel>>{};
// Key is provinceCode
final cachedHospitals = <String, List<Hospital>>{};
// Key is (provinceCode, districtCode)
final cachedWards = <(String, String), List<WardModel>>{};

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
    final result = BaseResponseList<DistrictModel>.fromJson(
      response,
      (json) => DistrictModel.fromJson(json),
    );

    if (result.isSuccess) {
      cachedDistricts[provinceCode] = result.result;
    }

    return result;
  }

  Future<BaseResponseList<WardModel>> getWards({
    required String provinceCode,
    required String districtCode,
  }) async {
    final key = (provinceCode, districtCode);
    if (cachedWards.containsKey(key)) {
      final wards = cachedWards[key];
      return BaseResponseList<WardModel>(
        code: AppConst.statusCodeSuccess,
        result: wards!,
        totalNumber: wards.length,
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetWards,
      EnumRequestMethod.get,
      jsonMap: {
        "provinceCode": provinceCode,
        "districtCode": districtCode,
      },
    );
    final result = BaseResponseList<WardModel>.fromJson(
      response,
      (json) => WardModel.fromJson(json),
    );

    if (result.isSuccess) {
      cachedWards[key] = result.result;
    }

    return result;
  }

  Future<BaseResponseList<Hospital>> getHospitals({
    required String provinceCode,
  }) async {
    if (cachedHospitals.containsKey(provinceCode)) {
      final hospitals = cachedHospitals[provinceCode];
      return BaseResponseList<Hospital>(
        code: AppConst.statusCodeSuccess,
        result: hospitals!,
        totalNumber: hospitals.length,
      );
    }

    final response = await baseCallApi(
      AppApi.urlGetHospitals,
      EnumRequestMethod.get,
      jsonMap: {
        "provinceCode": provinceCode,
      },
    );
    final result = BaseResponseList<Hospital>.fromJson(
      response,
      (json) => Hospital.fromJson(json),
    );

    if (result.isSuccess) {
      cachedHospitals[provinceCode] = result.result;
    }

    return result;
  }
}
