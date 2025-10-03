import 'package:v_bhxh/clean/shared/entity/account_info.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/clean/shared/mapper/update_unit_info_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/modules/unit_info/domain/entity/update_unit_info_request.dart';
import 'package:v_bhxh/modules/unit_info/domain/repository/unit_info_repository.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../core/values/app_api.dart';

class UnitInfoRepositoryImpl extends UnitInfoRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final AccountInfoDataMapper _accountInfoDataMapper;
  final UpdateUnitInfoRequestDataMapper _updateUnitInfoRequestDataMapper;
  UnitInfoRepositoryImpl(
    this._authAppServerApiClient,
    this._accountInfoDataMapper,
    this._updateUnitInfoRequestDataMapper,
  );
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
  Future<bool> updateAccountInfo({
    required UpdateUnitInfoRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlUpdateAccountInfo,
      cancelToken: cancelToken,
      body: _updateUnitInfoRequestDataMapper.mapToData(request).toJson(),
    );

    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<int> getToTalNotiUnread() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetNotificationUnread,
      cancelToken: cancelToken,
    );
    final data = BaseResponseCl<int>.fromJson(response);

    return data.result ?? 0;
  }
}
