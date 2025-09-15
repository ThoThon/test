import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/unit_info/domain/entity/update_unit_info_request.dart';

import '../../../../clean/shared/entity/entity_src.dart';

abstract class UnitInfoRepository extends BaseRepositoryCl {
  Future<bool> updateAccountInfo({
    required UpdateUnitInfoRequest request,
  });

  Future<AccountInfo> getAccountInfo();

  Future<int> getToTalNotiUnread();
}
