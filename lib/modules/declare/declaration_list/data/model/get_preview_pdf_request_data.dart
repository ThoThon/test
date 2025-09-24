class GetPreviewPdfRequestData {
  final String? declarationPeriodId;
  final int? previewDocumentType;
  final String? documentRecordId;

  const GetPreviewPdfRequestData({
    this.declarationPeriodId,
    this.previewDocumentType,
    this.documentRecordId,
  });

  Map<String, dynamic> toJson() {
    return {
      'kyKeKhaiId': declarationPeriodId,
      'documentType': previewDocumentType,
      'documentRecordId': documentRecordId,
    };
  }
}
