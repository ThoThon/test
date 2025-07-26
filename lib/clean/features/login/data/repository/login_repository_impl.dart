import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/data/model/base_response_cl.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/shares/mapper/mapper_src.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;
  final LoginRequestDataMapper _loginRequestDataMapper;

  LoginRepositoryImpl(
    this._nonAuthAppServerApiClient,
    this._loginRequestDataMapper,
  );

  @override
  Future<BaseResponseCl<String>> login({
    required LoginRequest request,
  }) async {
    final response = await _nonAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/api/Authen/auth',
      body: _loginRequestDataMapper.mapToData(request),
      cancelToken: cancelToken,
    );

    return BaseResponseCl<String>.fromJson(response);
  }
}
