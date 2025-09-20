import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';

import '../entity/entity_src.dart';

abstract class StaffList607Repository extends BaseRepositoryCl {
  Future<StaffList> getStaffList607({
    required String declarationPeriodId,
  });

  Future<SaveXmlResultCl> saveXml({
    required String declarationPeriodId,
  });
}
