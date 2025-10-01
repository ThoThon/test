import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../history_src.dart';

class GetRegisterHistoryListUseCase
    extends UseCase<RegisterHistoryListRequest, RegisterHistoryList> {
  final HistoryRepository _historyRepository;
  GetRegisterHistoryListUseCase(this._historyRepository);

  @override
  Future<RegisterHistoryList> execute(RegisterHistoryListRequest input) {
    return _historyRepository.getRegisterHistory(request: input); 
  }
}
