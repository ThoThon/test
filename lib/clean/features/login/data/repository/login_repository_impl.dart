import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/model/account_info_data.dart';
import 'package:v_bhxh/clean/core/data/model/base_response_cl.dart';
import 'package:v_bhxh/clean/shared/model/d02_categories_data.dart';
import 'package:v_bhxh/clean/shared/entity/account_info.dart';
import 'package:v_bhxh/clean/shared/entity/d02_categories_cl.dart';
import 'package:v_bhxh/clean/features/login/domain/entity/login_request.dart';
import 'package:v_bhxh/clean/features/login/domain/repository/login_repository.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

class LoginRepositoryImpl extends LoginRepository {
  final NonAuthAppServerApiClient _nonAuthAppServerApiClient;
  final AuthAppServerApiClient _authAppServerApiClient;

  final LoginRequestDataMapper _loginRequestDataMapper;
  final AccountInfoDataMapper _accountInfoDataMapper;
  final D02CategoriesDataMapper _d02CategoriesDataMapper;

  LoginRepositoryImpl(
    this._nonAuthAppServerApiClient,
    this._authAppServerApiClient,
    this._loginRequestDataMapper,
    this._accountInfoDataMapper,
    this._d02CategoriesDataMapper,
  );

  @override
  Future<String?> login({
    required LoginRequest request,
  }) async {
    final response = await _nonAuthAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlLogin,
      body: _loginRequestDataMapper.mapToData(request).toJson(),
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<String>.fromJson(response);

    return data.result;
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

  @override
  Future<D02CategoriesCl> getD02Categories() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetD02Categories,
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<D02CategoriesData>.fromJson(
      response,
      fromJson: (json) => D02CategoriesData.fromJson(json),
    );

    return _d02CategoriesDataMapper.mapToEntity(data.result);
  }

  @override
  Future<int> getUnreadNotificationCount() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetNotificationUnread,
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<int>.fromJson(response);

    return data.result ?? 0;
  }
}
