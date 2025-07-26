import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/data/model/account_info_data.dart';
import 'package:v_bhxh/clean/core/data/model/base_response_cl.dart';
import 'package:v_bhxh/clean/core/domain/entity/account_info.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/shares/mapper/mapper_src.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;

  final LoginRequestDataMapper _loginRequestDataMapper;
  final AccountInfoDataMapper _accountInfoDataMapper;

  LoginRepositoryImpl(
    this._nonAuthAppServerApiClient,
    this._authAppServerApiClient,
    this._loginRequestDataMapper,
    this._accountInfoDataMapper,
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

  @override
  Future<AccountInfo> getAccountInfo() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetAccountInfo,
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<AccountInfoData>.fromJson(
      response,
      fromJson: (json) => AccountInfoData.fromJson(json),
    );

    return _accountInfoDataMapper.mapToEntity(data.result);
  }
}
