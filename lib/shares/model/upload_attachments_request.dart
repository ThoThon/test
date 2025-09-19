class UploadImageRequest {
  final String file;
  final String periodId;

  UploadImageRequest({
    required this.file,
    required this.periodId,
  });

  Map<String, dynamic> toJson() {
    return {
      'kyKeKhaiId': periodId,
      'file': file,
    };
  }
}
