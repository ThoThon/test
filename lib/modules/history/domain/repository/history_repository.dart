import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../../../src.dart';

abstract class HistoryRepository extends BaseRepositoryCl {
  Future<DeclarationHistoryList> getDeclarationHistory({
    required DeclarationHistoryListRequest request,
  });

  Future<List<ProcedureTypeFilter>> getListProcedureFilter();

  Future<RegisterHistoryList> getRegisterHistory({
    required RegisterHistoryListRequest request,
  });

  Future<DeclarationHistoryRecordList> getDeclareHistoryRecordList({
    required String keyMap,
  });
}
