class UploadAttachmentsRequest {
  final List<String> file;
  final String periodId;

  UploadAttachmentsRequest({
    required this.file,
    required this.periodId,
  });

  Map<String, dynamic> toJson() {
    return {
      'kyKeKhaiId': periodId,
    };
  }
}
