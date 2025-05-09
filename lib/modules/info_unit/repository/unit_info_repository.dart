import 'package:v_bhxh/base_app/base_app.src.dart';

class UnitInfoRepository extends BaseRepository {
  UnitInfoRepository(super.controller);

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
