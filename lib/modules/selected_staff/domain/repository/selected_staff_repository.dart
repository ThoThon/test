import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/selected_staff/domain/entity/selected_staff_detail.dart';

import '../entity/selected_staff_request.dart';
import '../entity/selected_staff_response.dart';

abstract class SelectStaffRepository extends BaseRepositoryCl {
  Future<SelectStaffResponse> getStaffListSelect({
    required SelectStaffRequest request,
  });

  Future<SelectedStaffDetail> getSelectedStaffDetail({
    required String idStaff,
  });
}
