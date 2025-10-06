import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../../src.dart';

class GetDeclarationHistoryRecordListUseCase
    extends UseCase<String, DeclarationHistoryRecordList> {
  final HistoryRepository _historyRepository;
  GetDeclarationHistoryRecordListUseCase(this._historyRepository);

  @override
  Future<DeclarationHistoryRecordList> execute(String input) {
    return _historyRepository.getDeclareHistoryRecordList(keyMap: input);
  }
}
