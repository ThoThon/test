import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/entity_src.dart';

import '../repository/staff_list_repository.dart';

class SaveXmlResult600UseCase extends UseCase<String, SaveXmlResultCl> {
  final StaffListRepository _staffListRepository;

  SaveXmlResult600UseCase(this._staffListRepository);

  @override
  Future<SaveXmlResultCl> execute(String input) {
    return _staffListRepository.saveXml(declarationPeriodId: input);
  }
}
