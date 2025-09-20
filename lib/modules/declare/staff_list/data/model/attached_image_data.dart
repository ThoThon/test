class AttachedImageData {
  final String? fileName;
  final String? imgPath;

  AttachedImageData({
    this.fileName,
    this.imgPath,
  });

  factory AttachedImageData.fromJson(Map<String, dynamic> json) {
    return AttachedImageData(
      fileName: json['fileName'],
      imgPath: json['imgPath'],
    );
  }
}
