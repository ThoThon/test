import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/repository/staff_list_repository.dart';

class DeleteStaff600UseCase extends UseCase<String, bool> {
  final StaffListRepository _staffListRepository;

  DeleteStaff600UseCase(this._staffListRepository);

  @override
  Future<bool> execute(String input) {
    return _staffListRepository.deleteD02Tk1D01(id: input);
  }
}
