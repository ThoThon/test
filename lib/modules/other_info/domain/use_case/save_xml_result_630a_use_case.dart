import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/other_info/domain/repository/other_info_repository.dart';

import '../../../declare/staff_list/domain/entity/save_xml_result.dart';

class SaveXmlResult630aUseCase extends UseCase<String, SaveXmlResultCl> {
  final OtherInfoRepository _otherInfoRepository;

  SaveXmlResult630aUseCase(this._otherInfoRepository);

  @override
  Future<SaveXmlResultCl> execute(String input) {
    return _otherInfoRepository.saveXml630a(declarationPeriodId: input);
  }
}
