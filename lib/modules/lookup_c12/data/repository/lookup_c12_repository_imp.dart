import '../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../clean/shared/mapper/lookup_c12_data_mapper.dart';
import '../../../../clean/shared/model/model_src.dart';
import '../../../src.dart';
import '../../domain/entity/lookup_c12.dart';
import '../../domain/repository/lookup_c12_repository.dart';
import '../model/lookup_c12_data.dart';

class LookupC12RepositoryImp extends LookupC12Repository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final LookupC12DataMapper _lookupC12DataMapper;

  LookupC12RepositoryImp(
    this._authAppServerApiClient,
    this._lookupC12DataMapper,
  );

  @override
  Future<List<LookupC12>> getC12File({
    required int year,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlLookupC12,
      cancelToken: cancelToken,
      queryParameters: {
        'year': year,
      },
    );
    final data = BaseResponseListCl<LookupC12Data>.fromJson(
      response,
      LookupC12Data.fromJson,
    );
    return _lookupC12DataMapper.mapToListEntity(data.result);
  }
}
