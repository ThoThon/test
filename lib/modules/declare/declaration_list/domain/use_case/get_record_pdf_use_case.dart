import 'dart:async';

import 'package:v_bhxh/clean/core/domain/usecase/base_use_case.dart';

import '../../declaration_list_src.dart';
import '../entity/get_record_pdf_request.dart';

class GetRecordPdfUseCase extends UseCase<GetRecordPdfRequest, String> {
  final DeclarationListRepository _declarationListRepository;
  GetRecordPdfUseCase(this._declarationListRepository);
  @override
  Future<String> execute(GetRecordPdfRequest input) {
    return _declarationListRepository.getRecordPdf(request: input);
  }
}
