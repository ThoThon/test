import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';

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
    return BaseResponse<AccountInfoModel>.fromJson(
      response,
      fromJson: (json) => AccountInfoModel.fromJson(json),
    );
  }

  Future<BaseResponse<D02Categories>> getD02Categories() async {
    final response = await baseCallApi(
      AppApi.urlGetD02Categories,
      EnumRequestMethod.get,
    );
    return BaseResponse<D02Categories>.fromJson(
      response,
      fromJson: (json) => D02Categories.fromJson(json),
    );
  }

  // Lấy số thông báo chưa được đọc
  Future<BaseResponse<int>> getToTalNotiUnread() async {
    final response = await baseCallApi(
      AppApi.urlGetNotificationUnread,
      EnumRequestMethod.get,
    );
    return BaseResponse<int>.fromJson(response);
  }

  Future<BaseResponse<CategoriesProcedure630a>> get630aCategories() async {
    final response = await baseCallApi(
      AppApi.urlGet630aCategories,
      urlOther:
          'https://vbhxh1.easyhrm.vn/dev-api-mobile/api/HoSo630a/get-categories',
      EnumRequestMethod.get,
    );

    return BaseResponse<CategoriesProcedure630a>.fromJson(
      response,
      fromJson: (json) => CategoriesProcedure630a.fromJson(json),
    );
  }
}
