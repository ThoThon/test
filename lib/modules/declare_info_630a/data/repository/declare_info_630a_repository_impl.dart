import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/modules/declare_info_630a/data/model/declare_info_630a_response_data.dart';
import 'package:v_bhxh/modules/declare_info_630a/domain/entity/declare_info_630a.dart';
import 'package:v_bhxh/modules/declare_info_630a/domain/repository/declare_info_630a_repository.dart';

import '../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../clean/shared/mapper/mapper_src.dart';
import '../../../src.dart';

class DeclareInfo630aRepositoryImpl extends DeclareInfo630aRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclareInfo630aRequestDataMapper _declareInfo630aRequestDataMapper;
  final DeclareInfo630aResponseDataMapper _declareInfo630aResponseDataMapper;

  DeclareInfo630aRepositoryImpl(
    this._authAppServerApiClient,
    this._declareInfo630aRequestDataMapper,
    this._declareInfo630aResponseDataMapper,
  );
  @override
  Future<bool> addProcedure630a({
    required DeclareInfo630a request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlAdd630a,
      cancelToken: cancelToken,
      body: _declareInfo630aRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<DeclareInfo630a> getDetail630a({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetDetail630a,
      cancelToken: cancelToken,
      queryParameters: {
        "key": id,
      },
    );
    final data = BaseResponseCl<DeclareInfo630aResponseData>.fromJson(
      response,
      fromJson: (json) => DeclareInfo630aResponseData.fromJson(json),
    );
    return _declareInfo630aResponseDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> update630a({
    required DeclareInfo630a request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlUpdate630a,
      cancelToken: cancelToken,
      body: _declareInfo630aRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
