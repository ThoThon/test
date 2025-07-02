import 'package:v_bhxh/modules/change_base_url/ui/change_base_url_page.dart';
import 'package:v_bhxh/modules/declare_607/staff_list_607/ui/staff_list_607_page.dart';
import 'package:v_bhxh/modules/history_detail_register/ui/history_detail_register_page.dart';
import 'package:v_bhxh/modules/home/ui/home_page.dart';
import 'package:v_bhxh/modules/lookup_c12/ui/ui_src.dart';
import 'package:v_bhxh/modules/notification/ui/notification_page.dart';
import 'package:v_bhxh/modules/select_staff/ui/select_staff_page.dart';

import '../../modules/declare/declaration_list/ui/declaration_list_page.dart';
import '../../modules/declare/procedure_list/ui/procedure_list_page.dart';
import '../../modules/declare/staff_list/ui/staff_list_page.dart';
import '../../modules/home/src.dart';
import '../../modules/splash/splash.src.dart';
import '../../modules/splash/splash_page.dart';
import '../../modules/src.dart';
import '../../modules/view_pdf/ui/view_pdf_page.dart';
import '../../shares/package/export_package.dart';

class RouteAppPage {
  static var route = [
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
      name: AppRoutes.historyDetailDeclare.path,
      page: () => HistoryDetailDeclarePage(),
    ),
    GetPage(
      name: AppRoutes.historyDetailRegister.path,
      page: () => HistoryDetailRegisterPage(),
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
      name: AppRoutes.staffList.path,
      page: () => StaffListPage(),
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
      name: AppRoutes.declarationFormDetail.path,
      page: () => DeclarationFormDetailPage(),
    ),
    GetPage(
      name: AppRoutes.declarationList.path,
      page: () => DeclarationListPage(),
    ),
    GetPage(
      name: AppRoutes.viewPdf.path,
      page: () => ViewPdfPage(),
    ),
    // GetPage(
    //   name: AppRoutes.nfc.path,
    //   page: () => NfcPage(),
    // ),
    GetPage(
      name: AppRoutes.forgotLogin.path,
      page: () => ForgotPasswordPage(),
    ),
    GetPage(
      name: AppRoutes.lookupC12.path,
      page: () => LookupC12Page(),
    ),
    GetPage(
      name: AppRoutes.selectStaff.path,
      page: () => SelectStaffPage(),
    ),
    GetPage(
      name: AppRoutes.notification.path,
      page: () => NotificationPage(),
    ),
    GetPage(
      name: AppRoutes.profile.path,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: AppRoutes.registerService.path,
      page: () => RegisterServicePage(),
    ),
    GetPage(
      name: AppRoutes.registerCode.path,
      page: () => RegisterCodePage(),
    ),
    GetPage(
      name: AppRoutes.changeBaseUrl.path,
      page: () => const ChangeBaseUrlPage(),
    ),
    GetPage(
      name: AppRoutes.staffList607.path,
      page: () => StaffList607Page(),
    ),
  ];
}
