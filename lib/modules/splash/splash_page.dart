import 'package:flutter/services.dart';

import '../src.dart';

class SplashPage extends BaseGetWidget<AppController> {
  SplashPage({super.key});

  @override
  AppController get controller => _controller;

  final AppController _controller = Get.put(AppController(), permanent: true);

  @override
  Widget buildWidgets(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
