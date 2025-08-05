import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/base_app/repository_base/repository_base.src.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/staff_list_response.dart';

import '../../../src.dart';
import '../model/save_xml_result.dart';

class StaffList630aRepository extends BaseRepository {
  StaffList630aRepository(super.controller);

  Future<BaseResponse<StaffListResponse>> getListStaff630a({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetListStaff630a,
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

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ thủ tục 630a của nhân viên đó)
  Future<BaseResponse> delete630a({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlDelete630a,
      EnumRequestMethod.delete,
      queryParameters: {'id': id},
    );
    return BaseResponse.fromJson(response);
  }
}
