import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/data/model/base/base_response_cl.dart';
import 'package:v_bhxh/clean/features/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:v_bhxh/core/values/app_api.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;

  ForgotPasswordRepositoryImpl(
    this._nonAuthAppServerApiClient,
  );

  @override
  Future<bool> forgotPassword({
    required String unitCode,
    required String taxCode,
  }) async {
    final response = await _nonAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlForgotPassword,
      body: {
        'maDonVi': unitCode,
        'maSoThue': taxCode,
      },
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<String>.fromJson(response);

    return data.isSuccess;
  }
}
