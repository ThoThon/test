import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/select_staff_request.dart';
import '../entity/select_staff_response.dart';

abstract class SelectStaffRepository extends BaseRepositoryCl {
  Future<SelectStaffResponse> getStaffListSelect({
    required SelectStaffRequest request,
  });
}
