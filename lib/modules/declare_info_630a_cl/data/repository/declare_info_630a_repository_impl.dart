import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/data/model/declare_info_630a_data.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/entity/declare_info_630a.dart';
import 'package:v_bhxh/modules/declare_info_630a_cl/domain/repository/declare_info_630a_repository.dart';

import '../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../clean/shared/mapper/mapper_src.dart';
import '../../../src.dart';

class DeclareInfo630aRepositoryImpl extends DeclareInfo630aRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclareInfo630aDataMapper _declareInfo630aDataMapper;

  DeclareInfo630aRepositoryImpl(
    this._authAppServerApiClient,
    this._declareInfo630aDataMapper,
  );
  @override
  Future<bool> addProcedure630a({
    required DeclareInfo630a request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlAdd630a,
      cancelToken: cancelToken,
      queryParameters: _declareInfo630aDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<DeclareInfo630a> getDetail630a({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetDetail630a,
      cancelToken: cancelToken,
      queryParameters: {
        "key": id,
      },
    );
    final data = BaseResponseCl<DeclareInfo630aData>.fromJson(
      response,
      fromJson: (json) => DeclareInfo630aData.fromJson(json),
    );
    return _declareInfo630aDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> update630a({
    required DeclareInfo630a request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlUpdate630a,
      cancelToken: cancelToken,
      queryParameters: _declareInfo630aDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
