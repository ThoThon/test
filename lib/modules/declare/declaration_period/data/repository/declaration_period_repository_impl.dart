import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/data/model/model_src.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/declaration_period/data/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declaration_period/domain/repository/declaration_period_repository.dart';
import 'package:v_bhxh/shares/mapper/mapper_src.dart';

class DeclarationPeriodRepositoryImpl extends DeclarationPeriodRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclarationPeriodDataMapper _declarationPeriodDataMapper;

  DeclarationPeriodRepositoryImpl(
    this._authAppServerApiClient,
    this._declarationPeriodDataMapper,
  );

  @override
  Future<List<DeclarationPeriod>> getDeclarationPeriods({
    required int periodId,
    required int month,
    required int year,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetListDeclarationPeriod,
      queryParameters: {
        'maThuTuc': periodId,
        'thang': month,
        'nam': year,
      },
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<DeclarationPeriodListData>.fromJson(
      response,
      fromJson: (json) => DeclarationPeriodListData.fromJson(json),
    ).result?.periods;

    return _declarationPeriodDataMapper.mapToListEntity(data);
  }

  @override
  Future<bool> deleteDeclarationPeriod({
    required String id,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: '${AppApi.urlDeleteDeclarationPeriod}/$id',
      cancelToken: cancelToken,
    );

    return BaseResponseCl<bool>.fromJson(response).result ?? false;
  }

  @override
  Future<DeclarationPeriod> createDeclarationPeriod({
    required int procedureId,
    required int month,
    required int year,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlAddDeclarationPeriod,
      body: {
        'maThuTuc': procedureId,
        'thang': month,
        'nam': year,
      },
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<DeclarationPeriodData>.fromJson(
      response,
      fromJson: (json) => DeclarationPeriodData.fromJson(json),
    ).result;

    return _declarationPeriodDataMapper.mapToEntity(data);
  }
}
