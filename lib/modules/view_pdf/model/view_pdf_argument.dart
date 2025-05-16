class ViewPdfArgument {
  final String url;
  final String title;
  bool? isRotateHorizontall;

  ViewPdfArgument({
    required this.url,
    required this.title,
    this.isRotateHorizontall,
  });
}
