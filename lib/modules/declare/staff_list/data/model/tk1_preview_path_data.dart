class Tk1PreviewPathData {
  final String? hoTen;
  final String? documentRecordId;

  const Tk1PreviewPathData({
    this.hoTen,
    this.documentRecordId,
  });

  factory Tk1PreviewPathData.fromJson(Map<String, dynamic> json) {
    return Tk1PreviewPathData(
      hoTen: json['hoTen'],
      documentRecordId: json['documentRecordId'],
    );
  }
}
