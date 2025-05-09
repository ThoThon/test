import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/info_unit/models/account_info_model.dart';

import '../../src.dart';

class UnitInfoRepository extends BaseRepository {
  UnitInfoRepository(super.controller);

  Future<BaseResponse<AccountInfoModel>> getAccountInfo() async {
    final response = await baseCallApi(
      AppApi.urlGetAccountInfo,
      EnumRequestMethod.get,
    );
    return BaseResponse<AccountInfoModel>.fromJson(
      response,
      fromJson: (json) => AccountInfoModel.fromJson(json),
    );
  }

  // Future<BaseResponseList<DistrictResponse>> getListDistrict(
  //     String provinceCode) async {
  //   final request = {
  //     "provinceCode": provinceCode,
  //   };
  //   final response = await baseCallApi(
  //     AppApi.urlGetDistricts,
  //     EnumRequestMethod.get,
  //     jsonMap: request,
  //   );
  //   return BaseResponseList<DistrictResponse>.fromJson(
  //     response,
  //     DistrictResponse.fromJson,
  //   );
  // }

  // Future<BaseResponseList<WardResponse>> getListWard(
  //     String provinceCode, String districtCode) async {
  //   final request = {
  //     "provinceCode": provinceCode,
  //     "districtCode": districtCode,
  //   };
  //   final response = await baseCallApi(
  //     AppApi.urlGetWards,
  //     EnumRequestMethod.get,
  //     jsonMap: request,
  //   );
  //   return BaseResponseList<WardResponse>.fromJson(
  //     response,
  //     WardResponse.fromJson,
  //   );
  // }

  // Future<BaseResponseList<SocialAgencyResponse>> getSocialAgency({
  //   required String administrativeCode,
  // }) async {
  //   final request = {
  //     "administrativeCode": administrativeCode,
  //   };
  //   final response = await baseCallApi(
  //     AppApi.urlGetSocialAgency,
  //     EnumRequestMethod.get,
  //     jsonMap: request,
  //   );
  //   return BaseResponseList<SocialAgencyResponse>.fromJson(
  //     response,
  //     SocialAgencyResponse.fromJson,
  //   );
  // }
}
