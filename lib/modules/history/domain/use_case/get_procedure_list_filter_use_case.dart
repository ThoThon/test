import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../history_src.dart';

class GetProcedureListFilterUseCase
    extends NoInputUseCase<List<ProcedureTypeFilter>> {
  final HistoryRepository _historyRepository;
  GetProcedureListFilterUseCase(this._historyRepository);

  @override
  Future<List<ProcedureTypeFilter>> execute() {
    return _historyRepository.getListProcedureFilter();
  }
}
