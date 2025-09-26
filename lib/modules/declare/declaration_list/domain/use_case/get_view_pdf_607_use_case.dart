import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/declaration_list/domain/repository/declaration_list_repository.dart';

import '../entity/get_preview_pdf_request.dart';

class GetViewPdf607UseCase extends UseCase<GetPreviewPdfRequest, String> {
  final DeclarationListRepository _declarationListRepositoryCl;
  GetViewPdf607UseCase(this._declarationListRepositoryCl);

  @override
  Future<String> execute(GetPreviewPdfRequest input) {
    return _declarationListRepositoryCl.getPreviewPdf607(request: input);
  }
}
