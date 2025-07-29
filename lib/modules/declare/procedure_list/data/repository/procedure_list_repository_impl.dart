import 'package:v_bhxh/clean/core/data/data_source/network/network_src.dart';
import 'package:v_bhxh/clean/core/data/model/base/base_response_list_cl.dart';
import 'package:v_bhxh/core/values/app_api.dart';
import 'package:v_bhxh/modules/declare/procedure_list/data/model/procedure_data.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/entity/procedure.dart';
import 'package:v_bhxh/modules/declare/procedure_list/domain/repository/procedure_list_repository.dart';
import 'package:v_bhxh/shares/mapper/mapper_src.dart';

class ProcedureListRepositoryImpl extends ProcedureListRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final ProcedureDataMapper _procedureDataMapper;

  ProcedureListRepositoryImpl(
    this._authAppServerApiClient,
    this._procedureDataMapper,
  );

  @override
  Future<List<Procedure>> getProcedures() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetListProcedure,
      cancelToken: cancelToken,
    );

    final data = BaseResponseListCl<ProcedureData>.fromJson(
      response,
      ProcedureData.fromJson,
    );

    return _procedureDataMapper.mapToListEntity(data.result);
  }
}
