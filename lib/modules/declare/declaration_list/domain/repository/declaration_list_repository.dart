import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_list/domain/entity/get_preview_pdf_request.dart';

import '../entity/get_record_pdf_request.dart';

abstract class DeclarationListRepository extends BaseRepositoryCl {
  Future<String> getPreviewPdf({
    required GetPreviewPdfRequest request,
  });

  Future<String> getPreviewPdf607({
    required GetPreviewPdfRequest request,
  });

  Future<String> getPreviewPdf630a({
    required GetPreviewPdfRequest request,
  });

  Future<String> getPreviewPdf630b({
    required GetPreviewPdfRequest request,
  });

  Future<String> getPreviewPdf630c({
    required GetPreviewPdfRequest request,
  });

  Future<bool> signDocument({
    required String declarationPeriodId,
  });

  Future<String> getRecordPdf({
    required GetRecordPdfRequest request,
  });
}
