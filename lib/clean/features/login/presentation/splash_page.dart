import 'package:flutter/material.dart';
import 'package:v_bhxh/shares/widgets/utils_widget/utils_widget.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: UtilWidget.buildLoading(),
      ),
    );
  }
}
