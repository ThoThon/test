import 'package:v_bhxh/base_app/model/base_response.dart';
import 'package:v_bhxh/base_app/repository_base/base_repository.dart';
import 'package:v_bhxh/modules/src.dart';

const _signDocumentTimeOut = Duration(minutes: 3);

class DeclarationListRepository extends BaseRepository {
  DeclarationListRepository(super.controller);

  Future<BaseResponse> signDocument({
    required String declarationPeriodId,
  }) async {
    final response = await baseCallApi(
      AppApi.urlSignDocument, EnumRequestMethod.post,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
      // Cần chờ user mở app mysign để ký số nên set timeout là 3 phút
      timeOut: _signDocumentTimeOut,
      functionError: (err) {
        // rethrow error để xử lý ở controller
        throw err;
      },
    );
    return BaseResponse.fromJson(response);
  }
}
