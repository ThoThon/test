// Key is provinceCode
import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/repository/ward_repository.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

/// Cache theo provinceCode
final _cachedWards = <String, List<Ward>>{};

class WardRepositoryImpl extends WardRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final WardDataMapper _wardDataMapper;

  WardRepositoryImpl(
    this._authAppServerApiClient,
    this._wardDataMapper,
  );

  @override
  Future<List<Ward>> getWards({
    required String provinceCode,
  }) async {
    if (_cachedWards.containsKey(provinceCode)) {
      return _cachedWards[provinceCode]!;
    }

    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetWards,
      queryParameters: {
        "provinceCode": provinceCode,
      },
      cancelToken: cancelToken,
    );

    final data = BaseResponseListCl<WardData>.fromJson(
      response,
      WardData.fromJson,
    ).result;

    final wards = _wardDataMapper.mapToListEntity(data);
    _cachedWards[provinceCode] = wards;
    return wards;
  }
}
