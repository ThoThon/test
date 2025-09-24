import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';
import 'package:v_bhxh/modules/declare/declaration_list_clean/domain/repository/declaration_list_repository_cl.dart';

import '../entity/get_preview_pdf_request_cl.dart';

class GetViewPdf630aUseCase extends UseCase<GetPreviewPdfRequestCl, String> {
  final DeclarationListRepositoryCl _declarationListRepositoryCl;
  GetViewPdf630aUseCase(this._declarationListRepositoryCl);

  @override
  Future<String> execute(GetPreviewPdfRequestCl input) {
    return _declarationListRepositoryCl.getPreviewPdf630a(request: input);
  }
}
