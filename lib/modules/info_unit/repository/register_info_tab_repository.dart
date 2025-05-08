import 'package:v_bhxh/base_app/model/base_response_list.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/modules/info_unit/models/model_src.dart';

class RegisterInfoTabRepositoryICare extends BaseRepository {
  RegisterInfoTabRepositoryICare(super.controller);

  Future<BaseResponseList<ProvinceResponse>> getListProvince() async {
    final response = await baseCallApi(
      AppApi.urlGetProvinces,
      EnumRequestMethod.get,
    );
    return BaseResponseList<ProvinceResponse>.fromJson(
      response,
      ProvinceResponse.fromJson,
    );
  }

  Future<BaseResponseList<DistrictResponse>> getListDistrict(
      String provinceCode) async {
    final request = {
      "provinceCode": provinceCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetDistricts,
      EnumRequestMethod.get,
      jsonMap: request,
    );
    return BaseResponseList<DistrictResponse>.fromJson(
      response,
      DistrictResponse.fromJson,
    );
  }

  Future<BaseResponseList<WardResponse>> getListWard(
      String provinceCode, String districtCode) async {
    final request = {
      "provinceCode": provinceCode,
      "districtCode": districtCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetWards,
      EnumRequestMethod.get,
      jsonMap: request,
    );
    return BaseResponseList<WardResponse>.fromJson(
      response,
      WardResponse.fromJson,
    );
  }

  Future<BaseResponseList<SocialAgencyResponse>> getSocialAgency({
    required String administrativeCode,
  }) async {
    final request = {
      "administrativeCode": administrativeCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetSocialAgency,
      EnumRequestMethod.get,
      jsonMap: request,
    );
    return BaseResponseList<SocialAgencyResponse>.fromJson(
      response,
      SocialAgencyResponse.fromJson,
    );
  }
}
