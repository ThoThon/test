class Tk1PreviewPath {
  final String? hoTen;
  final String? previewPath;

  const Tk1PreviewPath({
    this.hoTen,
    this.previewPath,
  });

  factory Tk1PreviewPath.fromJson(Map<String, dynamic> json) {
    return Tk1PreviewPath(
      hoTen: json['hoTen'],
      previewPath: json['previewPath'],
    );
  }
}
