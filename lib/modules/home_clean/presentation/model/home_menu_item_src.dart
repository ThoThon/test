import 'dart:ui';

class HomeMenuItem {
  final String assetImage;
  final String title;
  final VoidCallback onPressd;

  HomeMenuItem({
    required this.assetImage,
    required this.title,
    required this.onPressd,
  });
}
