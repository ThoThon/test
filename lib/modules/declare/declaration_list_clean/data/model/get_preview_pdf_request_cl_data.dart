class GetPreviewPdfRequestClData {
  final String? declarationPeriodId;
  final int? previewDocumentType;
  final String? documentRecordId;

  const GetPreviewPdfRequestClData({
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
