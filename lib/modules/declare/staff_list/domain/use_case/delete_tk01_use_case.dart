import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_repository.dart';

class DeleteTk01UseCase extends UseCase<String, bool> {
  final StaffListRepository _staffListRepository;

  DeleteTk01UseCase(this._staffListRepository);

  @override
  Future<bool> execute(String input) {
    return _staffListRepository.deleteTk1D01(id: input);
  }
}
