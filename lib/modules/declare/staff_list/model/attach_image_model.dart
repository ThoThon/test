class AttachImageModel {
  final String fileName;
  final String imgPath;

  AttachImageModel({
    required this.fileName,
    required this.imgPath,
  });

  factory AttachImageModel.fromJson(Map<String, dynamic> json) {
    return AttachImageModel(
      fileName: json['fileName'] ?? '',
      imgPath: json['imgPath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
        'imgPath': imgPath,
      };
}
