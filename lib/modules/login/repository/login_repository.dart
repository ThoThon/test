import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';

import '../../../shares/function/logger.dart';
import '../model/model_src.dart';

class LoginRepository extends BaseRepository {
  LoginRepository(super.controller);

  Future<BaseResponse<String>> login({
    required String username,
    required String password,
  }) async {
    final body = {
      "Username": username,
      "Password": password,
    };

    final response = await baseCallApi(
      AppApi.urlLogin,
      EnumRequestMethod.post,
      jsonMap: body,
    );

    return BaseResponse<String>.fromJson(response);
  }

  Future<BaseResponse<AccountInfoModel>> getAccountInfo() async {
    final response = await baseCallApi(
      AppApi.urlGetAccountInfo,
      EnumRequestMethod.get,
    );
    logger.d(response);
    return BaseResponse<AccountInfoModel>.fromJson(
      response,
      fromJson: (json) => AccountInfoModel.fromJson(json),
    );
  }
}
