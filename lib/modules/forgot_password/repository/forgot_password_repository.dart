import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/base_app/repository_base/repository_base.src.dart';
import 'package:v_bhxh/modules/src.dart';

class ForgotPasswordRepository extends BaseRepository {
  ForgotPasswordRepository(super.controller);

  Future<BaseResponse> forgotPassword({
    required String unitCode,
    required String taxCode,
  }) async {
    final response = await baseCallApi(
      AppApi.urlForgotPassword,
      EnumRequestMethod.post,
      jsonMap: {
        'maDonVi': unitCode,
        'maSoThue': taxCode,
      },
    );
    return BaseResponse.fromJson(response);
  }
}
