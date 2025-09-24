import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/declare/declaration_list/data/model/get_preview_pdf_request_data.dart';
import 'package:v_bhxh/modules/declare/declaration_list/domain/entity/get_preview_pdf_request.dart';

class GetPreviewPdfRequestDataMapper
    extends BaseDataMapper<GetPreviewPdfRequestData, GetPreviewPdfRequest>
    with DataMapperMixin {
  @override
  GetPreviewPdfRequest mapToEntity(GetPreviewPdfRequestData? data) {
    return GetPreviewPdfRequest(
      documentRecordId: data?.documentRecordId ?? '',
      declarationPeriodId: data?.declarationPeriodId ?? '',
      previewDocumentType: data?.previewDocumentType ?? 0,
    );
  }

  @override
  GetPreviewPdfRequestData mapToData(GetPreviewPdfRequest entity) {
    return GetPreviewPdfRequestData(
      documentRecordId: entity.documentRecordId,
      declarationPeriodId: entity.declarationPeriodId,
      previewDocumentType: entity.previewDocumentType,
    );
  }
}
