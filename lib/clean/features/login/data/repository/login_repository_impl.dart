import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/data/model/base_response_cl.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;

  LoginRepositoryImpl(this._nonAuthAppServerApiClient);

  @override
  Future<BaseResponseCl<String>> login({
    required LoginRequest request,
  }) async {
    final response = await _nonAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: '/api/Authen/auth',
      body: request.toData().toJson(),
      cancelToken: cancelToken,
    );

    return BaseResponseCl<String>.fromJson(response);
  }
}
