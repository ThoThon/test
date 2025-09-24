import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_request.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_response.dart';
import 'package:v_bhxh/modules/selected_staff/domain/repository/selected_staff_repository.dart';

class GetStaffListSelectUseCase
    extends UseCase<SelectStaffRequest, SelectStaffResponse> {
  final SelectStaffRepository _selectStaffRepository;
  GetStaffListSelectUseCase(this._selectStaffRepository);

  @override
  Future<SelectStaffResponse> execute(SelectStaffRequest input) {
    return _selectStaffRepository.getStaffListSelect(request: input);
  }
}
