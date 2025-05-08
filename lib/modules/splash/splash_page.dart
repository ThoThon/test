import 'package:flutter/services.dart';

import '../../base_app/base_app.src.dart';
import '../src.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageLoginState();
}

class _SplashPageLoginState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

    // Đảm bảo status bar và navigation bar trong suốt
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor:
          Colors.transparent, // Thanh điều hướng trong suốt
      systemNavigationBarContrastEnforced: false,
      statusBarColor: Colors.transparent, // Thanh trạng thái trong suốt
      statusBarIconBrightness: Brightness.dark, // Icon màu đen
    ));
    _initAll();
  }

  Future<void> _initAll() async {
    Get.put(BaseApiIcare(), permanent: true);
    Get.put(BaseGetxControllerIcare(), permanent: true);
    MockSdk().isMock = true;
    MockSdk().mockEmail = "mobile_test_1";
    await Future.delayed(const Duration(seconds: 2), () {
      Get.offAndToNamed(AppRoutesIcare.declarationTaxCode.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Colors.transparent,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
      child: Scaffold(
        body: Container(
          alignment: Alignment.center,
          child: TextUtils(text: "Home"),
        ),
      ),
    );
  }
}
