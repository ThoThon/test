import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/declaration_list_clean/data/model/get_preview_pdf_request_cl_data.dart';
import 'package:v_bhxh/modules/declare/declaration_list_clean/domain/entity/get_preview_pdf_request_cl.dart';

class GetPreviewPdfRequestDataMapper
    extends BaseDataMapper<GetPreviewPdfRequestClData, GetPreviewPdfRequestCl>
    with DataMapperMixin {
  @override
  GetPreviewPdfRequestCl mapToEntity(GetPreviewPdfRequestClData? data) {
    return GetPreviewPdfRequestCl(
      documentRecordId: data?.documentRecordId ?? '',
      declarationPeriodId: data?.declarationPeriodId ?? '',
      previewDocumentType: data?.previewDocumentType ?? 0,
    );
  }

  @override
  GetPreviewPdfRequestClData mapToData(GetPreviewPdfRequestCl entity) {
    return GetPreviewPdfRequestClData(
      documentRecordId: entity.documentRecordId,
      declarationPeriodId: entity.declarationPeriodId,
      previewDocumentType: entity.previewDocumentType,
    );
  }
}
