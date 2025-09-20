import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_630_repository.dart';

class Delete630cUseCase extends UseCase<String, bool> {
  final StaffList630Repository _staffList630Repository;

  Delete630cUseCase(this._staffList630Repository);

  @override
  Future<bool> execute(String input) {
    return _staffList630Repository.delete630a(id: input);
  }
}
