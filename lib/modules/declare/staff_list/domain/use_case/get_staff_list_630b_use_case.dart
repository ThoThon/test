import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../entity/staff_list.dart';
import '../repository/staff_list_630_repository.dart';

class GetStaffList630bUseCase extends UseCase<String, StaffList> {
    final StaffList630Repository _staffList630Repository;

    GetStaffList630bUseCase(this._staffList630Repository);

  @override
  Future<StaffList> execute(String input) {
    return _staffList630Repository.getStaffList630b(
      declarationPeriodId: input,
    );
  }
}
