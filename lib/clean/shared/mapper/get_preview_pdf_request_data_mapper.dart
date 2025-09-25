import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/declare/declaration_list/declaration_list_src.dart';

class GetPreviewPdfRequestDataMapper
    extends BaseDataMapper<GetPreviewPdfRequestData, GetPreviewPdfRequest>
    with DataMapperMixin {
  @override
  GetPreviewPdfRequest mapToEntity(GetPreviewPdfRequestData? data) {
    return GetPreviewPdfRequest(
      documentRecordId: data?.documentRecordId ?? '',
      declarationPeriodId: data?.declarationPeriodId ?? '',
      previewDocumentType:
          PreviewDocumentTypeEnum.parse(data?.previewDocumentType) ??
              PreviewDocumentTypeEnum.d01,
    );
  }

  @override
  GetPreviewPdfRequestData mapToData(GetPreviewPdfRequest entity) {
    return GetPreviewPdfRequestData(
      documentRecordId: entity.documentRecordId,
      declarationPeriodId: entity.declarationPeriodId,
      previewDocumentType: entity.previewDocumentType.rawValue,
    );
  }
}
