import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/entity/declare_history_lookup_result.dart';
import 'package:v_bhxh/modules/history_detail_declare/domain/repository/history_detail_declare_repository.dart';

class DeclareHistoryLookupResultUseCase
    extends UseCase<String, DeclareHistoryLookupResult> {
  final HistoryDetailDeclareRepository _historyRepository;
  DeclareHistoryLookupResultUseCase(this._historyRepository);
  @override
  Future<DeclareHistoryLookupResult> execute(String input) {
    return _historyRepository.lookupProcessHistory(soHoSo: input);
  }
}
