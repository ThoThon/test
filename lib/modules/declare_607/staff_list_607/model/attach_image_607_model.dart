class AttachImage607Model {
  final String fileName;
  final String imgPath;

  AttachImage607Model({
    required this.fileName,
    required this.imgPath,
  });

  factory AttachImage607Model.fromJson(Map<String, dynamic> json) {
    return AttachImage607Model(
      fileName: json['fileName'] ?? '',
      imgPath: json['imgPath'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'fileName': fileName,
        'imgPath': imgPath,
      };
}
