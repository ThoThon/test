import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/info_unit/models/update_account_info_request.dart';
import 'package:v_bhxh/modules/src.dart';

class UnitInfoRepository extends BaseRepository {
  UnitInfoRepository(super.controller);

  Future<BaseResponse> updateAccountInfo(
      UpdateAccountInfoRequest request) async {
    final response = await baseCallApi(
      AppApi.urlUpdateAccountInfo,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    logger.d(response);
    return BaseResponse.fromJson(response);
  }
}
