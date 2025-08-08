import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/clean/shared/entity/district.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/repository/district_repository.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

// Key is provinceCode
final _cachedDistricts = <String, List<District>>{};

class DistrictRepositoryImpl extends DistrictRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DistrictDataMapper _districtDataMapper;

  DistrictRepositoryImpl(
    this._authAppServerApiClient,
    this._districtDataMapper,
  );

  @override
  Future<List<District>> getDistricts({
    required String provinceCode,
  }) async {
    if (_cachedDistricts.containsKey(provinceCode)) {
      return _cachedDistricts[provinceCode]!;
    }

    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetDistricts,
      queryParameters: {
        "provinceCode": provinceCode,
      },
      cancelToken: cancelToken,
    );

    final data = BaseResponseListCl<DistrictData>.fromJson(
      response,
      DistrictData.fromJson,
    ).result;

    return _districtDataMapper.mapToListEntity(data);
  }
}
