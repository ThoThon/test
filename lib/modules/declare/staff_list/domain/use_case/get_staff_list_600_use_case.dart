import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_repository.dart';

import '../entity/staff_list.dart';

class GetStaffList600UseCase extends UseCase<String, StaffList> {
  final StaffListRepository _staffListRepository;

  GetStaffList600UseCase(this._staffListRepository);

  @override
  Future<StaffList> execute(String input) {
    return _staffListRepository.getListOfDeclaredStaff(
      declarationPeriodId: input,
    );
  }
}
