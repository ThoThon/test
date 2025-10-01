import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/history_detail_declare_cl/domain/entity/file_number.dart';

import '../repository/history_detail_declare_repository.dart';

class GetFileNumberUseCase extends UseCase<String, FileNumber> {
  final HistoryDetailDeclareRepository _historyRepository;
  GetFileNumberUseCase(this._historyRepository);
  @override
  Future<FileNumber> execute(String input) {
    return _historyRepository.getFileNumber(key: input);
  }
}
