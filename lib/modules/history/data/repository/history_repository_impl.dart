import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/mapper/declaration_history_list_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/declaration_history_list_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/declaration_history_record_list_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/procedure_type_filter_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/register_history_list_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/register_history_list_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';

import '../../../src.dart';
import '../model/declaration_history_record_list_data.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclarationHistoryListDataMapper _declarationHistoryListDataMapper;
  final DeclarationHistoryListRequestDataMapper
      _declarationHistoryListRequestDataMapper;
  final RegisterHistoryListDataMapper _registerHistoryListDataMapper;
  final RegisterHistoryListRequestDataMapper
      _registerHistoryListRequestDataMapper;
  final ProcedureTypeFilterDataMapper _procedureTypeFilterDataMapper;
  final DeclarationHistoryRecordListDataMapper
      _declarationHistoryRecordListDataMapper;

  HistoryRepositoryImpl(
    this._authAppServerApiClient,
    this._declarationHistoryListDataMapper,
    this._declarationHistoryListRequestDataMapper,
    this._registerHistoryListDataMapper,
    this._registerHistoryListRequestDataMapper,
    this._procedureTypeFilterDataMapper,
    this._declarationHistoryRecordListDataMapper,
  );

  @override
  Future<DeclarationHistoryList> getDeclarationHistory({
    required DeclarationHistoryListRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetHistoryDeclare,
      cancelToken: cancelToken,
      body:
          _declarationHistoryListRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<DeclarationHistoryListData>.fromJson(
      response,
      fromJson: (json) => DeclarationHistoryListData.fromJson(json),
    );

    return _declarationHistoryListDataMapper.mapToEntity(data.result);
  }

  @override
  Future<RegisterHistoryList> getRegisterHistory({
    required RegisterHistoryListRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlGetHistoryRegister,
      cancelToken: cancelToken,
      body: _registerHistoryListRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<RegisterHistoryListData>.fromJson(
      response,
      fromJson: (json) => RegisterHistoryListData.fromJson(json),
    );

    return _registerHistoryListDataMapper.mapToEntity(data.result);
  }

  @override
  Future<List<ProcedureTypeFilter>> getListProcedureFilter() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetListProcedureHistory,
      cancelToken: cancelToken,
    );
    final data = BaseResponseListCl<ProcedureTypeFilterData>.fromJson(
      response,
      ProcedureTypeFilterData.fromJson,
    );
    return _procedureTypeFilterDataMapper.mapToListEntity(data.result);
  }

  @override
  Future<DeclarationHistoryRecordList> getDeclareHistoryRecordList({
    required String keyMap,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetDeclarationRecord,
      cancelToken: cancelToken,
      queryParameters: {"keyMap": keyMap},
    );

    final data = BaseResponseCl<DeclarationHistoryRecordListData>.fromJson(
      response,
      fromJson: (json) => DeclarationHistoryRecordListData.fromJson(json),
    );

    return _declarationHistoryRecordListDataMapper.mapToEntity(data.result);
  }
}
