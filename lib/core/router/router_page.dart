import 'package:v_bhxh/modules/certificate_list/ui/list_certificate_page.dart';
import 'package:v_bhxh/modules/certificate_list/ui/verify_cert_page.dart';
import 'package:v_bhxh/modules/confirm_code/ui/confirm_code_page.dart';
import 'package:v_bhxh/modules/declare/declaration_period/ui/declaration_period_page.dart';
import 'package:v_bhxh/modules/declare/declaration_period_detail/ui/declaration_period_detail_page.dart';
import 'package:v_bhxh/modules/declare/declare_info/ui/declare_info_page.dart';
import 'package:v_bhxh/modules/declare/procedure_list/ui/procedure_list_page.dart';
import 'package:v_bhxh/modules/home/ui/home_page.dart';
import 'package:v_bhxh/modules/login/ui/login_page.dart';
import 'package:v_bhxh/modules/page_builder/page_builder.dart';

import '../../modules/await_confirm_signature/ui/await_confirm_signature_page.dart';
import '../../modules/declare/check_list_detail/ui/check_list_detail_page.dart';
import '../../modules/declare/family_member_detail/ui/family_member_detail_page.dart';
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
    ),
    GetPage(
      name: AppRoutes.splash.path,
      page: () => SplashPage(),
    ),
    GetPage(
      name: AppRoutes.home.path,
      page: () => HomePage(),
    ),
    GetPage(
      name: AppRoutes.declarationTaxCode.path,
      page: () => DeclarationTaxCodePage(),
    ),
    GetPage(
      name: AppRoutes.declarationTaxCodeDetail.path,
      page: () => DeclarationTaxCodeDetailPage(),
    ),
    GetPage(
      name: AppRoutes.infoUnit.path,
      page: () => UnitInfoPage(),
    ),
    GetPage(
      name: AppRoutes.history.path,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: AppRoutes.historyDetail.path,
      page: () => HistoryDetailPage(),
    ),
    GetPage(
      name: AppRoutes.listCertificate.path,
      page: () => ListCertificatePage(),
    ),
    GetPage(
      name: AppRoutes.confirmCode.path,
      page: () => ConfirmCodePage(),
    ),
    GetPage(
      name: AppRoutes.awaitConfirmSignature.path,
      page: () => AwaitConfirmSignaturePage(),
    ),
    GetPage(
      name: AppRoutes.verifyCertificate.path,
      page: () => VerifyCertPageICare(),
    ),
    GetPage(
      name: AppRoutes.procedureList.path,
      page: () => ProcedureListPage(),
    ),
    GetPage(
      name: AppRoutes.declarationPeriod.path,
      page: () => DeclarationPeriodPage(),
    ),
    GetPage(
      name: AppRoutes.declarationPeriodDetail.path,
      page: () => DeclarationPeriodDetailPage(),
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
  ];
}
