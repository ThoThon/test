import 'package:v_bhxh/modules/home/ui/home_page.dart';

import '../../modules/declare/declaration_list/ui/declaration_list_page.dart';
import '../../modules/declare/deposit_info/ui/deposit_info_page.dart';
import '../../modules/declare/procedure_list/ui/procedure_list_page.dart';
import '../../modules/home/src.dart';
import '../../modules/nfc/ui/nfc_page.dart';
import '../../modules/nfc_information_user/nfc_information_user_src.dart';
import '../../modules/splash/splash.src.dart';
import '../../modules/splash/splash_page.dart';
import '../../modules/src.dart';
import '../../modules/view_pdf/ui/view_pdf_page.dart';
import '../../shares/package/export_package.dart';

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
      name: AppRoutes.procedureList.path,
      page: () => ProcedureListPage(),
    ),
    GetPage(
      name: AppRoutes.declarationPeriod.path,
      page: () => DeclarationPeriodPage(),
    ),
    GetPage(
      name: AppRoutes.depositInfo.path,
      page: () => DepositInfoPage(),
      transition: Transition.rightToLeft,
    ),
    GetPage(
      name: AppRoutes.declareInfo.path,
      page: () => DeclareInfoPage(),
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
    GetPage(
      name: AppRoutes.nfc.path,
      page: () => NfcPage()
    ),
    GetPage(
      name: AppRoutes.nfcInformationUser.path,
      page: () => NfcInformationUserPage(),
    ),
  ];
}
