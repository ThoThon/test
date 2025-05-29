import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/select_staff/model/staff_list_request.dart';
import 'package:v_bhxh/modules/select_staff/model/staff_list_response.dart';
import 'package:v_bhxh/modules/src.dart';

class SelectStaffRepository extends BaseRepository {
  SelectStaffRepository(super.controller);

  Future<BaseResponse<StaffListResponse>> getStaffListSelect(
    StaffListRequest request,
  ) async {
    final response = await baseCallApi(
      AppApi.urlGetStaffListSelect,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    logger.d(response);
    logger.d(request.toJson());
    return BaseResponse<StaffListResponse>.fromJson(
      response,
      fromJson: (json) => StaffListResponse.fromJson(json),
    );
  }
}
