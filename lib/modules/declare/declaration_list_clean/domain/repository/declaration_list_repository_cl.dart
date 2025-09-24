import 'package:v_bhxh/clean/core/domain/repository/base_repository_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_list_clean/domain/entity/get_preview_pdf_request_cl.dart';

abstract class DeclarationListRepositoryCl extends BaseRepositoryCl {
  Future<String> getPreviewPdf({
    required GetPreviewPdfRequestCl request,
  });

  Future<String> getPreviewPdf607({
    required GetPreviewPdfRequestCl request,
  });

  Future<String> getPreviewPdf630a({
    required GetPreviewPdfRequestCl request,
  });

  Future<String> getPreviewPdf630b({
    required GetPreviewPdfRequestCl request,
  });

  Future<String> getPreviewPdf630c({
    required GetPreviewPdfRequestCl request,
  });

  Future<bool> signDocument({
    required String declarationPeriodId,
  });
}
