import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/entity/select_staff_request.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/entity/select_staff_response.dart';
import 'package:v_bhxh/modules/select_staff_cl/domain/repository/select_staff_repository.dart';

class GetStaffListSelectUseCase
    extends UseCase<SelectStaffRequest, SelectStaffResponse> {
  final SelectStaffRepository _selectStaffRepository;
  GetStaffListSelectUseCase(this._selectStaffRepository);

  @override
  Future<SelectStaffResponse> execute(SelectStaffRequest input) {
    return _selectStaffRepository.getStaffListSelect(request: input);
  }
}
