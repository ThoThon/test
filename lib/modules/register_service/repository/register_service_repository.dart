import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/register_service/register_service_src.dart';
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

  Future<BaseResponse> cancelRegister() async {
    final response = await baseCallApi(
      AppApi.urlCancelRegister,
      EnumRequestMethod.post,
      // Cần chờ user mở app mysign để ký số nên set timeout là 3 phút
      timeOut: _signDocumentTimeOut,
      functionError: (err) {
        // rethrow error để xử lý ở controller
        throw err;
      },
    );
    return BaseResponse.fromJson(
      response,
    );
  }

  Future<BaseResponse> changeInfo({
    required String userId,
    required String credentialID,
  }) async {
    final response = await baseCallApi(
      AppApi.urlChangeInfo,
      EnumRequestMethod.post,
      queryParameters: {
        'userId': userId,
        'credentialID': credentialID,
      },
      // Cần chờ user mở app mysign để ký số nên set timeout là 3 phút
      timeOut: _signDocumentTimeOut,
      functionError: (err) {
        // rethrow error để xử lý ở controller
        throw err;
      },
    );
    return BaseResponse.fromJson(
      response,
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
      functionError: (err) {
        // rethrow error để xử lý ở controller
        throw err;
      },
    );
    return BaseResponse.fromJson(response);
  }
}
