import 'package:v_bhxh/modules/certificate_list/ui/list_certificate_page.dart';
import 'package:v_bhxh/modules/certificate_list/ui/verify_cert_page.dart';
import 'package:v_bhxh/modules/confirm_code/ui/confirm_code_page.dart';
import 'package:v_bhxh/modules/home/ui/home_page.dart';
import 'package:v_bhxh/modules/login/ui/login_page.dart';
import 'package:v_bhxh/modules/page_builder/page_builder.dart';

import '../../modules/await_confirm_signature/ui/await_confirm_signature_page.dart';
import '../../modules/splash/splash_page.dart';
import '../../modules/src.dart';

class RouteAppPage {
  static var route = [
    GetPage(
      name: AppRoutes.pageBuilder.path,
      page: () => PageBuilder(),
    ),
    GetPage(
      name: AppRoutes.login.path,
      page: () => LoginPage(),
    ),
    GetPage(
      name: AppRoutes.routeDioLog.path,
      page: () => const HttpLogListWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.splash.path,
      page: () => SplashPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.home.path,
      page: () => HomePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.declarationTaxCode.path,
      page: () => DeclarationTaxCodePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.declarationTaxCodeDetail.path,
      page: () => DeclarationTaxCodeDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.infoUnit.path,
      page: () => UnitInfoPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.historyTransaction.path,
      page: () => HistoryTransactionPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.historyRegisterDetail.path,
      page: () => HistoryRegisterDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.listCertificate.path,
      page: () => ListCertificatePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.confirmCode.path,
      page: () => ConfirmCodePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.awaitConfirmSignature.path,
      page: () => AwaitConfirmSignaturePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.verifyCertificate.path,
      page: () => VerifyCertPageICare(),
      transition: Transition.rightToLeft,
    )
  ];
}
