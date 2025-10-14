import 'package:v_bhxh/modules/declare_info_630c/domain/entity/declare_info_630c.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../clean/shared/mapper/declare_info_630c_request_data_mapper.dart';
import '../../../../clean/shared/mapper/declare_info_630c_response_data_mapper.dart';
import '../../../../core/values/app_api.dart';
import '../../domain/repository/declare_info_630c_repository.dart';
import '../model/declare_info_630c_response_data.dart';

class DeclareInfo630cRepositoryImpl extends DeclareInfo630cRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclareInfo630cRequestDataMapper _declareInfo630cRequestDataMapper;
  final DeclareInfo630cResponseDataMapper _declareInfo630cResponseDataMapper;

  DeclareInfo630cRepositoryImpl(
    this._authAppServerApiClient,
    this._declareInfo630cRequestDataMapper,
    this._declareInfo630cResponseDataMapper,
  );

  @override
  Future<bool> addProcedure630c({
    required DeclareInfo630c request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlAdd630c,
      cancelToken: cancelToken,
      body: _declareInfo630cRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<DeclareInfo630c> getDetail630c({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetDetail630c,
      cancelToken: cancelToken,
      queryParameters: {
        "key": id,
      },
    );
    final data = BaseResponseCl<DeclareInfo630cResponseData>.fromJson(
      response,
      fromJson: (json) => DeclareInfo630cResponseData.fromJson(json),
    );
    return _declareInfo630cResponseDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> update630c({
    required DeclareInfo630c request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlUpdate630c,
      cancelToken: cancelToken,
      body: _declareInfo630cRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
