import '../../../base_app/base_app.src.dart';
import '../../src.dart';

class RegisterCodeRepository extends BaseRepository {
  RegisterCodeRepository(super.controller);

  Future<BaseResponse<RegisterCodeCategories>>
      getRegisterFirstCategories() async {
    final response = await baseCallApi(
      AppApi.urlGetRegisterFirstCategories,
      EnumRequestMethod.get,
    );
    logger.d(response);
    return BaseResponse<RegisterCodeCategories>.fromJson(
      response,
      fromJson: (json) => RegisterCodeCategories.fromJson(json),
    );
  }

  Future<BaseResponseList<CertificateModel>> getListCert(String userId) async {
    final response = await baseCallApi(
      AppApi.urlGetListCert,
      EnumRequestMethod.get,
      jsonMap: {
        "userId": userId,
      },
    );
    logger.d(response);
    return BaseResponseList<CertificateModel>.fromJson(
      response,
      (json) => CertificateModel.fromJson(json),
    );
  }
}
