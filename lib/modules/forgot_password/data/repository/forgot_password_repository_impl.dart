import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/data/model/base_response_cl.dart';
import 'package:v_bhxh/clean/shared/mapper/forgot_password_request_data_mapper.dart';

import 'package:v_bhxh/modules/forgot_password/domain/entity/forgot_password_request.dart';
import 'package:v_bhxh/modules/forgot_password/domain/repository/forgot_password_repository.dart';
import 'package:v_bhxh/core/values/app_api.dart';

class ForgotPasswordRepositoryImpl extends ForgotPasswordRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;
  final ForgotPasswordRequestDataMapper _forgotPasswordRequestDataMapper;

  ForgotPasswordRepositoryImpl(
    this._nonAuthAppServerApiClient,
    this._forgotPasswordRequestDataMapper,
  );

  @override
  Future<String?> forgotPassword({
    required ForgotPasswordRequest request,
  }) async {
    final response = await _nonAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlForgotPassword,
      body: _forgotPasswordRequestDataMapper.mapToData(request).toJson(),
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<String>.fromJson(response);

    return data.result;
  }
}
