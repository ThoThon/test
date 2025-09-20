import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/other_info/domain/entity/other_info.dart';

import '../../../declare/staff_list/domain/entity/save_xml_result.dart';

abstract class OtherInfoRepository extends BaseRepositoryCl {
  Future<String> addOtherInfo({
    required OtherInfo request,
  });

  Future<bool> updateOtherInfo({
    required OtherInfo request,
  });

  Future<OtherInfo> getOtherInfoDetail({
    required String key,
  });

  Future<SaveXmlResultCl> saveXml630a({
    required String declarationPeriodId,
  });

  Future<SaveXmlResultCl> saveXml630b({
    required String declarationPeriodId,
  });

  Future<SaveXmlResultCl> saveXml630c({
    required String declarationPeriodId,
  });
}
