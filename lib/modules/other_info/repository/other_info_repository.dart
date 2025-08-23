import 'package:v_bhxh/modules/declare/staff_list/model/save_xml_result.dart';

import '../../../base_app/model/base_response.dart';
import '../../../base_app/repository_base/base_repository.dart';
import '../../src.dart';

class OtherInfoRepository extends BaseRepository {
  OtherInfoRepository(super.controller);

  Future<BaseResponse<String>> addOtherInfo(OtherInfoModel request) async {
    final response = await baseCallApi(
      AppApi.urlAddMs,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse<String>.fromJson(response);
  }

  Future<BaseResponse> updateOtherInfo(OtherInfoModel request) async {
    final response = await baseCallApi(
      AppApi.urlUpdateMs,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<OtherInfoModel>> getOtherInfoDetail(String key) async {
    final response = await baseCallApi(
      AppApi.urlGetDetailMs,
      EnumRequestMethod.get,
      jsonMap: {"key": key},
    );
    return BaseResponse.fromJson(
      response,
      fromJson: (json) => OtherInfoModel.fromJson(json),
    );
  }

  Future<BaseResponse<SaveXmlResult>> saveXml630a({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSaveXml630a,
      EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );
    return BaseResponse<SaveXmlResult>.fromJson(
      response,
      fromJson: (json) => SaveXmlResult.fromJson(json),
    );
  }

  Future<BaseResponse<SaveXmlResult>> saveXml630b({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSaveXml630b,
      EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );
    return BaseResponse<SaveXmlResult>.fromJson(
      response,
      fromJson: (json) => SaveXmlResult.fromJson(json),
    );
  }

  Future<BaseResponse<SaveXmlResult>> saveXml630c({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSaveXml630c,
      EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Có thể việc gen pdf ở BE tốn thời gian, nên cần tăng thời gian timeout
      timeOut: const Duration(minutes: 2),
    );
    return BaseResponse<SaveXmlResult>.fromJson(
      response,
      fromJson: (json) => SaveXmlResult.fromJson(json),
    );
  }
}
