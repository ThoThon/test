import '../../../modules/src.dart';

class IcarePage extends StatelessWidget {
  const IcarePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      alignment: Alignment.center,
      child: Center(
        child: Scaffold(
          body: Container(
            alignment: Alignment.center,
            child: const SDSBuildText("Đang chuyển tới ICare..."),
          ),
        ),
      ),
    );
  }
}

// class IcarePage extends StatefulWidget {
//   const IcarePage({super.key});

//   @override
//   State<IcarePage> createState() => _IcarePageLoginState();
// }

// class _IcarePageLoginState extends State<IcarePage> {
//   @override
//   void initState() {
//     super.initState();
//     SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

//     // Đảm bảo status bar và navigation bar trong suốt
//     SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
//       systemNavigationBarColor:
//           Colors.transparent, // Thanh điều hướng trong suốt
//       systemNavigationBarContrastEnforced: false,
//       statusBarColor: Colors.transparent, // Thanh trạng thái trong suốt
//       statusBarIconBrightness: Brightness.dark, // Icon màu đen
//     ));
//     _initAll();
//   }

//   Future<void> _initAll() async {
//     Assets.isFromModules = true;
//     Get.put(BaseApiIcare(), permanent: true);
//     Get.put(BaseGetxControllerIcare(), permanent: true);
//     await Future.delayed(const Duration(microseconds: 200), () {
//       Get.toNamed(AppRoutesIcare.declarationTaxCode.path);
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return AnnotatedRegion<SystemUiOverlayStyle>(
//       value: const SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         systemNavigationBarColor: Colors.transparent,
//         systemNavigationBarIconBrightness: Brightness.light,
//       ),
//       child: Scaffold(
//         body: Container(
//           alignment: Alignment.center,
//           child: TextButton(
//             onPressed: () {
//               Get.toNamed(AppRoutesIcare.declarationTaxCode.path);
//             },
//             child: const Text('Go to Declaration Tax Code'),
//           ),
//           //  SDSBuildText("Home"),
//         ),
//       ),
//     );
//   }
// }
