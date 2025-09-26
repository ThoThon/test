import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../history_src.dart';

class GetDeclarationHistoryListUseCase
    extends UseCase<DeclarationHistoryListRequest, DeclarationHistoryList> {
  final HistoryRepository _historyRepository;
  GetDeclarationHistoryListUseCase(this._historyRepository);

  @override
  Future<DeclarationHistoryList> execute(DeclarationHistoryListRequest input) {
    return _historyRepository.getDeclarationHistory(request: input);
  }
}
