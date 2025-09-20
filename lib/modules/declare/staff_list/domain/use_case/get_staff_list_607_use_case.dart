import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../entity/staff_list.dart';
import '../repository/staff_list_607_repository.dart';

class GetStaffList607UseCase extends UseCase<String, StaffList> {
  final StaffList607Repository _staffList607Repository;

  GetStaffList607UseCase(this._staffList607Repository);

  @override
  Future<StaffList> execute(String input) {
    return _staffList607Repository.getStaffList607(
      declarationPeriodId: input,
    );
  }
}
