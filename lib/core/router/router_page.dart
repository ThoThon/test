import 'package:v_bhxh/modules/certificate_list/ui/list_certificate_page.dart';
import 'package:v_bhxh/modules/certificate_list/ui/verify_cert_page.dart';
import 'package:v_bhxh/modules/confirm_code/ui/confirm_code_page.dart';
import 'package:v_bhxh/modules/create_transaction/ui/create_transaction_page.dart';
import 'package:v_bhxh/modules/declaration_tax_code/ui/declaration_tax_code_detail_page.dart';
import 'package:v_bhxh/modules/declaration_tax_code/ui/declaration_tax_code_page.dart';
import 'package:v_bhxh/modules/declare/check_list_detail/ui/check_list_detail_page.dart';
import 'package:v_bhxh/modules/declare/declaration_list/ui/declaration_list_page.dart';
import 'package:v_bhxh/modules/declare/declaration_period/ui/declaration_period_page.dart';
import 'package:v_bhxh/modules/declare/deposit_info/ui/deposit_info_page.dart';
import 'package:v_bhxh/modules/declare/declare_info/ui/declare_info_page.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/ui/family_member_detail_page.dart';
import 'package:v_bhxh/modules/declare/procedure_list/ui/procedure_list_page.dart';
import 'package:v_bhxh/modules/history_register_detail/ui/history_register_detail_page.dart';
import 'package:v_bhxh/modules/history_transaction/ui/history_transaction_page.dart';
import 'package:v_bhxh/modules/home/ui/home_page.dart';
import 'package:v_bhxh/modules/login/ui/login_page.dart';
import 'package:v_bhxh/modules/page_builder/page_builder.dart';
import 'package:v_bhxh/modules/view_pdf/ui/view_pdf_page.dart';

import '../../modules/await_confirm_signature/ui/await_confirm_signature_page.dart';
import '../../modules/splash/splash_page.dart';
import '../../shares/shares.src.dart';
import 'app_route.dart';

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
      name: AppRoutes.createTransaction.path,
      page: () => CreateTransactionPage(),
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
    ),
    GetPage(
      name: AppRoutes.procedureList.path,
      page: () => ProcedureListPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.declarationPeriod.path,
      page: () => DeclarationPeriodPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.depositInfo.path,
      page: () => DepositInfoPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.declareInfo.path,
      page: () => DeclareInfoPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.familyMemberDetail.path,
      page: () => FamilyMemberDetailPage(),
    ),
    GetPage(
      name: AppRoutes.checkListDetail.path,
      page: () => CheckListDetailPage(),
    ),
    GetPage(
      name: AppRoutes.declarationList.path,
      page: () => DeclarationListPage(),
    ),
    GetPage(
      name: AppRoutes.viewPdf.path,
      page: () => ViewPdfPage(),
    ),
  ];
}
