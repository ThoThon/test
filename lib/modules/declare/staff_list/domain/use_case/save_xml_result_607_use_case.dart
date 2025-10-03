import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/staff_list/domain/entity/entity_src.dart';

import '../repository/staff_list_607_repository.dart';

class SaveXmlResult607UseCase extends UseCase<String, SaveXmlResultCl> {
  final StaffList607Repository _staffList607Repository;

  SaveXmlResult607UseCase(this._staffList607Repository);

  @override
  Future<SaveXmlResultCl> execute(String input) {
    return _staffList607Repository.saveXml(declarationPeriodId: input);
  }
}
