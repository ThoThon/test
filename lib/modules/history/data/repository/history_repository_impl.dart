import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/shared/mapper/declaration_history_list_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/declaration_history_list_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/procedure_type_filter_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/register_history_list_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/register_history_list_request_data_mapper.dart';
import 'package:v_bhxh/clean/shared/model/model_src.dart';
import 'package:v_bhxh/modules/history/data/model/declaration_history_list_data.dart';
import 'package:v_bhxh/modules/history/data/model/procedure_type_filter_data.dart';
import 'package:v_bhxh/modules/history/data/model/regsister_history_list_data.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_list.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_list_request.dart';
import 'package:v_bhxh/modules/history/domain/entity/procedure_type_filter.dart';
import 'package:v_bhxh/modules/history/domain/entity/register_history_list_request.dart';
import 'package:v_bhxh/modules/history/domain/repository/history_repository.dart';

import '../../../src.dart';
import '../../domain/entity/register_history_list.dart';

class HistoryRepositoryImpl extends HistoryRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final DeclarationHistoryListDataMapper _declarationHistoryListDataMapper;
  final DeclarationHistoryListRequestDataMapper
      _declarationHistoryListRequestDataMapper;
  final RegisterHistoryListDataMapper _registerHistoryListDataMapper;
  final RegisterHistoryListRequestDataMapper
      _registerHistoryListRequestDataMapper;
  final ProcedureTypeFilterDataMapper _procedureTypeFilterDataMapper;

  HistoryRepositoryImpl(
    this._authAppServerApiClient,
    this._declarationHistoryListDataMapper,
    this._declarationHistoryListRequestDataMapper,
    this._registerHistoryListDataMapper,
    this._registerHistoryListRequestDataMapper,
    this._procedureTypeFilterDataMapper,
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
}
