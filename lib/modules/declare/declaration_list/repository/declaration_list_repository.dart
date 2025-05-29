import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/core/enum/enum_request_method.dart';
import 'package:v_bhxh/core/values/app_api.dart';

class DeclarationListRepository extends BaseRepository {
  DeclarationListRepository(super.controller);

  Future<BaseResponse> signDocument({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSignDocument,
      EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Cần chờ user mở app mysign để ký số nên set timeout là 3 phút
      timeOut: const Duration(minutes: 3),
    );
    return BaseResponse.fromJson(response);
  }
}
