import 'package:v_bhxh/base_app/model/base_response_list.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/core.src.dart';
import 'package:v_bhxh/modules/info_unit/models/model_src.dart';

class RegisterInfoTabRepositoryICare extends BaseRepository {
  RegisterInfoTabRepositoryICare(super.controller);

  Future<BaseResponseListIcare<ProvinceResponse>> getListProvince() async {
    final response = await baseCallApi(
      AppApi.urlGetProvinces,
      EnumRequestMethod.get,
      isHaveVersion: false,
    );
    return BaseResponseListIcare<ProvinceResponse>.fromJson(
      response,
      ProvinceResponse.fromJson,
    );
  }

  Future<BaseResponseListIcare<DistrictResponse>> getListDistrict(
      String provinceCode) async {
    final request = {
      "provinceCode": provinceCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetDistricts,
      EnumRequestMethod.get,
      isHaveVersion: false,
      jsonMap: request,
    );
    return BaseResponseListIcare<DistrictResponse>.fromJson(
      response,
      DistrictResponse.fromJson,
    );
  }

  Future<BaseResponseListIcare<WardResponse>> getListWard(
      String provinceCode, String districtCode) async {
    final request = {
      "provinceCode": provinceCode,
      "districtCode": districtCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetWards,
      EnumRequestMethod.get,
      isHaveVersion: false,
      jsonMap: request,
    );
    return BaseResponseListIcare<WardResponse>.fromJson(
      response,
      WardResponse.fromJson,
    );
  }

  Future<BaseResponseListIcare<SocialAgencyResponse>> getSocialAgency({
    required String administrativeCode,
  }) async {
    final request = {
      "administrativeCode": administrativeCode,
    };
    final response = await baseCallApi(
      AppApi.urlGetSocialAgency,
      EnumRequestMethod.get,
      isHaveVersion: false,
      jsonMap: request,
    );
    return BaseResponseListIcare<SocialAgencyResponse>.fromJson(
      response,
      SocialAgencyResponse.fromJson,
    );
  }
}
