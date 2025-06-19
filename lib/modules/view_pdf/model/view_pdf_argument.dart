class ViewPdfArgument {
  final String url;
  final String title;
  bool? isRotateHorizontal;
  bool? enableDownloadButton;

  ViewPdfArgument({
    required this.url,
    required this.title,
    this.isRotateHorizontal,
    this.enableDownloadButton,
  });
}
