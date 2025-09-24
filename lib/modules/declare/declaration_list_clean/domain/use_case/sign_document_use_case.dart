import 'dart:async';

import 'package:v_bhxh/modules/declare/declaration_list_clean/domain/repository/declaration_list_repository_cl.dart';

import '../../../../../clean/core/domain/usecase/base_use_case.dart';

class SignDocumentUseCase extends UseCase<String, bool> {
  final DeclarationListRepositoryCl _declarationListRepositoryCl;
  SignDocumentUseCase(this._declarationListRepositoryCl);
  @override
  Future<bool> execute(String input) {
    return _declarationListRepositoryCl.signDocument(
        declarationPeriodId: input);
  }
}
