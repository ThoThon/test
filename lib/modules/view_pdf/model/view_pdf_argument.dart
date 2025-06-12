class ViewPdfArgument {
  final String url;
  final String title;
  bool? isRotateHorizontal;

  ViewPdfArgument({
    required this.url,
    required this.title,
    this.isRotateHorizontal,
  });
}
