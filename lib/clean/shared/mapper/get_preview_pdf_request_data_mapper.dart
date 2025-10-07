import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/declare/declaration_list/declaration_list_src.dart';

class GetPreviewPdfRequestDataMapper
    extends BaseEntityMapper<GetPreviewPdfRequest, GetPreviewPdfRequestData> {
  @override
  GetPreviewPdfRequestData mapToData(GetPreviewPdfRequest entity) {
    return GetPreviewPdfRequestData(
      documentRecordId: entity.documentRecordId,
      declarationPeriodId: entity.declarationPeriodId,
      previewDocumentType: entity.previewDocumentType.rawValue,
    );
  }
}
