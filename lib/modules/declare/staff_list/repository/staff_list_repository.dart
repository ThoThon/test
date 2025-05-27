import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';

class StaffListRepository extends BaseRepository {
  StaffListRepository(super.controller);

  Future<BaseResponse<StaffListResponse>> getStaffList({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetStaffList,
      EnumRequestMethod.get,
      jsonMap: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    return BaseResponse<StaffListResponse>.fromJson(
      response,
      fromJson: (json) => StaffListResponse.fromJson(json),
    );
  }
}
