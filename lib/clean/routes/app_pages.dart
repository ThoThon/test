import 'package:dio_log_sds/dio_log_sds.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/features/login/presentation/binding/login_binding.dart';
import 'package:v_bhxh/clean/features/login/presentation/login_page.dart';
import 'package:v_bhxh/clean/routes/app_routes.dart';
import 'package:v_bhxh/modules/change_base_url/ui/change_base_url_page.dart';
import 'package:v_bhxh/modules/declare/declaration_form_detail/ui/declaration_form_detail_page.dart';
import 'package:v_bhxh/modules/declare/declaration_list/ui/declaration_list_page.dart';
import 'package:v_bhxh/modules/declare/declaration_period/ui/declaration_period_page.dart';
import 'package:v_bhxh/modules/declare/declare_info/ui/declare_info_page.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/ui/family_member_detail_page.dart';
import 'package:v_bhxh/modules/declare/procedure_list/ui/procedure_list_page.dart';
import 'package:v_bhxh/modules/declare/staff_list/ui/staff_list_page.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/ui/declare_info_607_page.dart';
import 'package:v_bhxh/modules/forgot_password/ui/forgot_password_page.dart';
import 'package:v_bhxh/modules/history/ui/history_page.dart';
import 'package:v_bhxh/modules/history_detail_declare/ui/history_detail_declare_page.dart';
import 'package:v_bhxh/modules/history_detail_register/ui/history_detail_register_page.dart';
import 'package:v_bhxh/modules/home/ui/home_page.dart';
import 'package:v_bhxh/modules/info_unit/ui/unit_info_page.dart';
import 'package:v_bhxh/modules/lookup_c12/ui/lookup_c12_page.dart';
import 'package:v_bhxh/modules/notification/ui/notification_page.dart';
import 'package:v_bhxh/modules/profile/ui/profile_page.dart';
import 'package:v_bhxh/modules/register_code/ui/register_code_page.dart';
import 'package:v_bhxh/modules/register_service/ui/register_service_page.dart';
import 'package:v_bhxh/modules/select_staff/ui/select_staff_page.dart';
import 'package:v_bhxh/modules/view_pdf/ui/view_pdf_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutes.login.path,
      page: LoginPage.new,
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutes.routeDioLog.path,
      page: () => const HttpLogListWidget(),
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
      name: AppRoutes.declareInfo607.path,
      page: () => DeclareInfo607Page(),
    ),
  ];
}
