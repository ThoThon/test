import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/register_service/register_service_src.dart';
import 'package:v_bhxh/modules/src.dart';

class RegisterServiceRepository extends BaseRepository {
  RegisterServiceRepository(super.controller);

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
