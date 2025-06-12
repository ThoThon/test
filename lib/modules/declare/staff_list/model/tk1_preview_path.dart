class Tk1PreviewPath {
  final String? hoTen;
  final String? documentRecordId;

  const Tk1PreviewPath({
    this.hoTen,
    this.documentRecordId,
  });

  factory Tk1PreviewPath.fromJson(Map<String, dynamic> json) {
    return Tk1PreviewPath(
      hoTen: json['hoTen'],
      documentRecordId: json['documentRecordId'],
    );
  }
}
