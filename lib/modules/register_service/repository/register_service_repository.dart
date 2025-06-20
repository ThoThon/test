import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/src.dart';

const _signDocumentTimeOut = Duration(minutes: 3);

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
    return BaseResponseList<CertificateModel>.fromJson(
      response,
      (json) => CertificateModel.fromJson(json),
    );
  }

  Future<BaseResponse<RegisterServiceInfoModel>>
      fetchRegisterServiceInfo() async {
    final response = await baseCallApi(
      AppApi.urlFetchRegisterServiceInfo,
      EnumRequestMethod.get,
    );
    return BaseResponse<RegisterServiceInfoModel>.fromJson(
      response,
      fromJson: (json) => RegisterServiceInfoModel.fromJson(json),
    );
  }

  Future<BaseResponse> registerNewService({
    required String userId,
    required String credentialID,
  }) async {
    final response = await baseCallApi(
      AppApi.urlRegisterNewService,
      EnumRequestMethod.post,
      queryParameters: {
        'userId': userId,
        'credentialID': credentialID,
      },
      // Cần chờ user mở app mysign để ký số nên set timeout là 3 phút
      timeOut: _signDocumentTimeOut,
    );
    logger.d(response);
    return BaseResponse.fromJson(response);
  }
}
