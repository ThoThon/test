import 'package:v_bhxh/modules/declare_info_630b/domain/entity/declare_info_630b.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../clean/shared/mapper/mapper_src.dart';
import '../../../../core/values/app_api.dart';
import '../../domain/repository/declare_info_630b_repository.dart';
import '../model/declare_info_630b_response_data.dart';

class DeclareInfo630bRepositoryImpl extends DeclareInfo630bRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclareInfo630bRequestDataMapper _declareInfo630bRequestDataMapper;
  final DeclareInfo630bResponseDataMapper _declareInfo630bResponseDataMapper;

  DeclareInfo630bRepositoryImpl(
    this._authAppServerApiClient,
    this._declareInfo630bRequestDataMapper,
    this._declareInfo630bResponseDataMapper,
  );

  @override
  Future<bool> addProcedure630b({
    required DeclareInfo630b request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlAdd630b,
      cancelToken: cancelToken,
      body: _declareInfo630bRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<DeclareInfo630b> getDetail630b({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetDetail630b,
      cancelToken: cancelToken,
      queryParameters: {
        "key": id,
      },
    );
    final data = BaseResponseCl<DeclareInfo630bResponseData>.fromJson(
      response,
      fromJson: (json) => DeclareInfo630bResponseData.fromJson(json),
    );
    return _declareInfo630bResponseDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> update630b({
    required DeclareInfo630b request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlUpdate630b,
      cancelToken: cancelToken,
      body: _declareInfo630bRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
