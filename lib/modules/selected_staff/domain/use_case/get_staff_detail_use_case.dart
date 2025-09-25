import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_detail.dart';
import 'package:v_bhxh/modules/selected_staff/domain/repository/selected_staff_repository.dart';

class GetStaffDetailUseCase extends UseCase<String, SelectedStaffDetail> {
  final SelectStaffRepository _selectStaffRepository;

  GetStaffDetailUseCase(this._selectStaffRepository);
  @override
  Future<SelectedStaffDetail> execute(String input) {
    return _selectStaffRepository.getSelectedStaffDetail(idStaff: input);
  }
}
