import 'dart:async';

import 'package:v_bhxh/modules/declare/declaration_list/domain/repository/declaration_list_repository.dart';

import '../../../../../clean/core/domain/usecase/base_use_case.dart';

class SignDocumentUseCase extends UseCase<String, bool> {
  final DeclarationListRepository _declarationListRepositoryCl;
  SignDocumentUseCase(this._declarationListRepositoryCl);
  @override
  Future<bool> execute(String input) {
    return _declarationListRepositoryCl.signDocument(
        declarationPeriodId: input);
  }
}
