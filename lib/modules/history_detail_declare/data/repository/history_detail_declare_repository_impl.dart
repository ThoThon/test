import 'package:v_bhxh/clean/core/data/model/base_response_cl.dart';
import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/history_detail_declare/data/model/declare_history_lookup_result_data.dart';
import 'package:v_bhxh/modules/history_detail_declare/data/model/file_number_data.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/entity/declare_history_lookup_result.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/entity/file_number.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/repository/history_detail_declare_repository.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';
import '../../../../core/values/app_api.dart';

class HistoryDetailDeclareRepositoryImpl
    extends HistoryDetailDeclareRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclareHistoryLookupResultDataMapper
      _declareHistoryLookupResultDataMapper;
  final FileNumberDataMapper _fileNumberDataMapper;

  HistoryDetailDeclareRepositoryImpl(
    this._authAppServerApiClient,
    this._declareHistoryLookupResultDataMapper,
    this._fileNumberDataMapper,
  );

  @override
  Future<FileNumber> getFileNumber({
    required String key,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetFileNumber,
      cancelToken: cancelToken,
      queryParameters: {"key": key},
    );
    final data = BaseResponseCl<FileNumberData>.fromJson(
      response,
      fromJson: (json) => FileNumberData.fromJson(json),
    );
    return _fileNumberDataMapper.mapToEntity(data.result);
  }

  @override
  Future<DeclareHistoryLookupResult> lookupProcessHistory({
    required String soHoSo,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlLookupProgressHistory,
      cancelToken: cancelToken,
      queryParameters: {"soHoSo": soHoSo},
    );

    final data = BaseResponseCl<DeclareHistoryLookupResultData>.fromJson(
      response,
      fromJson: (json) => DeclareHistoryLookupResultData.fromJson(json),
    );
    return _declareHistoryLookupResultDataMapper.mapToEntity(data.result);
  }
}
