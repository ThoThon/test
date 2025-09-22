import '../../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../../clean/shared/mapper/mapper_src.dart';
import '../../../../src.dart';

class StaffList630RepositoryImpl extends StaffList630Repository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final StaffListDataMapper _staffListDataMapper;

  StaffList630RepositoryImpl(
    this._authAppServerApiClient,
    this._staffListDataMapper,
  );

  @override
  Future<StaffList> getStaffList630a({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetListStaff630a,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl.fromJson(
      response,
      fromJson: (json) => StaffListData.fromJsonTk1(json),
    );
    return _staffListDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> delete630a({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: AppApi.urlDelete630a,
      cancelToken: cancelToken,
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<StaffList> getStaffList630b({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetListStaff630b,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl.fromJson(
      response,
      fromJson: (json) => StaffListData.fromJson630b(json),
    );
    return _staffListDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> delete630b({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: AppApi.urlDelete630c,
      cancelToken: cancelToken,
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<StaffList> getStaffList630c({
    required String declarationPeriodId,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetListStaff630c,
      cancelToken: cancelToken,
      queryParameters: {
        "kyKeKhaiId": declarationPeriodId,
      },
    );
    final data = BaseResponseCl.fromJson(
      response,
      fromJson: (json) => StaffListData.fromJson630b(json),
    );
    return _staffListDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> delete630c({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: AppApi.urlDelete630c,
      cancelToken: cancelToken,
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
