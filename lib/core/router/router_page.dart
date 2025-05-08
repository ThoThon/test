import 'package:v_bhxh/modules/certificate_list/ui/list_certificate_page.dart';
import 'package:v_bhxh/modules/certificate_list/ui/verify_cert_page.dart';
import 'package:v_bhxh/modules/confirm_code/ui/confirm_code_page.dart';
import 'package:v_bhxh/modules/declaration_tax_code/ui/declaration_tax_code_detail_page.dart';
import 'package:v_bhxh/modules/declaration_tax_code/ui/declaration_tax_code_page.dart';
import 'package:v_bhxh/modules/history_register_detail/ui/history_register_detail_page.dart';
import 'package:v_bhxh/modules/history_transaction/ui/history_transaction_page.dart';
import 'package:v_bhxh/modules/home/ui/home_screen.dart';
import 'package:v_bhxh/modules/info_unit/ui/unit_info_page.dart';

import '../../modules/await_confirm_signature/ui/await_confirm_signature_page.dart';
import '../../modules/splash/splash_page.dart';
import '../../shares/shares.src.dart';
import 'app_route.dart';

class RouteAppPageIcare {
  static var route = [
    GetPage(
      name: AppRoutesIcare.routeDioLog.path,
      page: () => const HttpLogListWidget(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.splash.path,
      page: () => const SplashPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.home.path,
      page: () => HomeScreen(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.declarationTaxCode.path,
      page: () => DeclarationTaxCodePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.declarationTaxCodeDetail.path,
      page: () => DeclarationTaxCodeDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.infoUnit.path,
      page: () => UnitInfoPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.historyTransaction.path,
      page: () => HistoryTransactionPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.historyRegisterDetail.path,
      page: () => HistoryRegisterDetailPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.listCertificate.path,
      page: () => ListCertificatePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.confirmCode.path,
      page: () => ConfirmCodePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.awaitConfirmSignature.path,
      page: () => AwaitConfirmSignaturePage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutesIcare.verifyCertificate.path,
      page: () => VerifyCertPageICare(),
      transition: Transition.rightToLeft,
    )
  ];
}
