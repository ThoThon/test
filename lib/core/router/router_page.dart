import 'package:v_bhxh/modules/nfc/ui/nfc_page.dart';
import 'package:v_bhxh/modules/nfc_information_user/nfc_information_user_src.dart';

import '../../modules/declare/declaration_period_detail/ui/declaration_period_detail_page.dart';
import '../../modules/declare/declare_info/ui/declare_info_page.dart';
import '../../modules/declare/procedure_list/ui/procedure_list_page.dart';
import '../../modules/home/src.dart';
import '../../modules/splash/splash.src.dart';
import '../../modules/src.dart';
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
      name: AppRoutes.declarationPeriodDetail.path,
      page: () => DeclarationPeriodDetailPage(),
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
      name: AppRoutes.nfc.path,
      page: () => NfcPage(),
    ),
    GetPage(
      name: AppRoutes.nfcInformationUser.path,
      page: () => NfcInformationUserPage(),
    ),
  ];
}
