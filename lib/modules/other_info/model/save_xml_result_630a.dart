class SaveXmlResult630a {
  final bool hasOdM01hsb;
  final String? attachPreviewPath;

  const SaveXmlResult630a({
    required this.hasOdM01hsb,
    this.attachPreviewPath,
  });

  factory SaveXmlResult630a.fromJson(Map<String, dynamic> json) {
    return SaveXmlResult630a(
      hasOdM01hsb: json['hasOdM01hsb'] ?? false,
      attachPreviewPath: json['attachPreviewPath'] ?? '',
    );
  }
}
