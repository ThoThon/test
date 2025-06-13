import 'package:equatable/equatable.dart';

import 'preview_document_type_enum.dart';

class GetPreviewPdfRequest extends Equatable {
  final String declarationPeriodId;
  final PreviewDocumentTypeEnum previewDocumentType;
  final String? documentRecordId;

  const GetPreviewPdfRequest({
    required this.declarationPeriodId,
    required this.previewDocumentType,
    this.documentRecordId,
  });

  @override
  List<Object?> get props =>
      [declarationPeriodId, previewDocumentType, documentRecordId];

  Map<String, dynamic> toJson() {
    return {
      'kyKeKhaiId': declarationPeriodId,
      'documentType': previewDocumentType.value,
      'documentRecordId': documentRecordId,
    };
  }
}
