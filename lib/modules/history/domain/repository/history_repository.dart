import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_list.dart';
import 'package:v_bhxh/modules/history/domain/entity/declaration_history_list_request.dart';
import 'package:v_bhxh/modules/history/domain/entity/register_history_list_request.dart';

import '../entity/procedure_type_filter.dart';
import '../entity/register_history_list.dart';

abstract class HistoryRepository extends BaseRepositoryCl {
  Future<DeclarationHistoryList> getDeclarationHistory({
    required DeclarationHistoryListRequest request,
  });

  Future<List<ProcedureTypeFilter>> getListProcedureFilter();

  Future<RegisterHistoryList> getRegisterHistory({
    required RegisterHistoryListRequest request,
  });
}
