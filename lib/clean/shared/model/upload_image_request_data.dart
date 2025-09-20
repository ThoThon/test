class UploadImageRequestData {
  final String file;
  final String periodId;

  UploadImageRequestData({
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
