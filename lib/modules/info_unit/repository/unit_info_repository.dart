import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/info_unit/models/update_account_info_request.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../clean/shared/entity/account_info.dart';

class UnitInfoRepository extends BaseRepository {
  UnitInfoRepository(super.controller);

  Future<BaseResponse> updateAccountInfo(
      UpdateAccountInfoRequest request) async {
    final response = await baseCallApi(
      AppApi.urlUpdateAccountInfo,
      EnumRequestMethod.post,
      jsonMap: request.toJson(),
    );
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<AccountInfo>> getAccountInfo() async {
    final response = await baseCallApi(
      AppApi.urlGetAccountInfo,
      EnumRequestMethod.get,
    );
    return BaseResponse<AccountInfo>.fromJson(
      response,
      fromJson: (json) => AccountInfo.fromJson(json),
    );
  }

  Future<BaseResponse<int>> getToTalNotiUnread() async {
    final response = await baseCallApi(
      AppApi.urlGetNotificationUnread,
      EnumRequestMethod.get,
    );
    return BaseResponse<int>.fromJson(response);
  }
}
