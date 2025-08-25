import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/base_app/repository_base/repository_base.src.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/staff_list_response.dart';

import '../../../src.dart';

class StaffList630Repository extends BaseRepository {
  StaffList630Repository(super.controller);

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

  Future<BaseResponse<StaffListResponse>> getListStaff630b({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetListStaff630b,
      EnumRequestMethod.get,
      jsonMap: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    return BaseResponse<StaffListResponse>.fromJson(
      response,
      fromJson: (json) => StaffListResponse.fromJson630b(json),
    );
  }

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ thủ tục 630b của nhân viên đó)
  Future<BaseResponse> delete630b({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlDelete630b,
      EnumRequestMethod.delete,
      queryParameters: {'id': id},
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<StaffListResponse>> getListStaff630c({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetListStaff630c,
      EnumRequestMethod.get,
      jsonMap: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    return BaseResponse<StaffListResponse>.fromJson(
      response,
      fromJson: (json) => StaffListResponse.fromJson630b(json),
    );
  }

  /// Xóa nhân viên (Xóa toàn bộ hồ sơ thủ tục 630b của nhân viên đó)
  Future<BaseResponse> delete630c({
    required String id,
  }) async {
    final response = await baseCallApi(
      AppApi.urlDelete630b,
      EnumRequestMethod.delete,
      queryParameters: {'id': id},
    );
    return BaseResponse.fromJson(response);
  }
}
