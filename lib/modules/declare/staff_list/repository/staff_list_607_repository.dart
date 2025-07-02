import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';

class StaffList607Repository extends BaseRepository {
  StaffList607Repository(super.controller);

  Future<BaseResponse<StaffListResponse>> getStaffList({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetStaffList607,
      EnumRequestMethod.get,
      jsonMap: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    return BaseResponse<StaffListResponse>.fromJson(
      response,
      fromJson: (json) => StaffListResponse.fromJsonTk1(json),
    );
  }

  Future<BaseResponse<SaveXmlResult>> saveXml({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSaveXml607,
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
