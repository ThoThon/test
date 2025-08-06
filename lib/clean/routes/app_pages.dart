import 'package:dio_log_sds/dio_log_sds.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/clean/features/login/presentation/binding/login_binding.dart';
import 'package:v_bhxh/clean/features/login/presentation/login_page.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/change_base_url/ui/change_base_url_page.dart';
import 'package:v_bhxh/modules/declare/declaration_form_detail/ui/declaration_form_detail_page.dart';
import 'package:v_bhxh/modules/declare/declaration_list/ui/declaration_list_page.dart';
import 'package:v_bhxh/modules/declare/declaration_period/presentation/binding/declaration_period_binding.dart';
import 'package:v_bhxh/modules/declare/declaration_period/presentation/declaration_period_page.dart';
import 'package:v_bhxh/modules/declare/declare_info/ui/declare_info_page.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/presentation/binding/family_member_detail_binding.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/presentation/family_member_detail_page.dart';
import 'package:v_bhxh/modules/declare/procedure_list/presentation/binding/procedure_list_binding.dart';
import 'package:v_bhxh/modules/declare/procedure_list/presentation/procedure_list_page.dart';
import 'package:v_bhxh/modules/declare/staff_list/ui/staff_list_page.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/ui/declare_info_607_page.dart';
import 'package:v_bhxh/modules/declare_info_630a/ui/declare_info_630a_page.dart';
import 'package:v_bhxh/modules/forgot_password/ui/forgot_password_page.dart';
import 'package:v_bhxh/modules/history/ui/history_page.dart';
import 'package:v_bhxh/modules/history_detail_declare/ui/history_detail_declare_page.dart';
import 'package:v_bhxh/modules/history_detail_register/ui/history_detail_register_page.dart';
import 'package:v_bhxh/modules/home_clean/presentation/binding/home_binding.dart';
import 'package:v_bhxh/modules/home_clean/presentation/view/home_page.dart';
import 'package:v_bhxh/modules/info_unit/ui/unit_info_page.dart';
import 'package:v_bhxh/modules/lookup_c12/ui/lookup_c12_page.dart';
import 'package:v_bhxh/modules/notification/ui/notification_page.dart';
import 'package:v_bhxh/modules/other_info/ui/other_info_page.dart';
import 'package:v_bhxh/modules/profile/ui/profile_page.dart';
import 'package:v_bhxh/modules/register_code/ui/register_code_page.dart';
import 'package:v_bhxh/modules/register_service/ui/register_service_page.dart';
import 'package:v_bhxh/modules/select_staff/ui/select_staff_page.dart';
import 'package:v_bhxh/modules/view_pdf/ui/view_pdf_page.dart';

class AppPages {
  static final pages = [
    GetPage(
      name: AppRoutesCl.login.path,
      page: LoginPage.new,
      binding: LoginBinding(),
    ),
    GetPage(
      name: AppRoutesCl.routeDioLog.path,
      page: () => const HttpLogListWidget(),
    ),
    GetPage(
      name: AppRoutesCl.home.path,
      page: HomePageCL.new,
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutesCl.infoUnit.path,
      page: () => UnitInfoPage(),
    ),
    GetPage(
      name: AppRoutesCl.history.path,
      page: () => HistoryPage(),
    ),
    GetPage(
      name: AppRoutesCl.historyDetailDeclare.path,
      page: () => HistoryDetailDeclarePage(),
    ),
    GetPage(
      name: AppRoutesCl.historyDetailRegister.path,
      page: () => HistoryDetailRegisterPage(),
    ),
    GetPage(
      name: AppRoutesCl.procedureList.path,
      page: () => ProcedureListPage(),
      binding: ProcedureListBinding(),
    ),
    GetPage(
      name: AppRoutesCl.declarationPeriod.path,
      page: () => DeclarationPeriodPage(),
      binding: DeclarationPeriodBinding(),
    ),
    GetPage(
      name: AppRoutesCl.staffList.path,
      page: () => StaffListPage(),
    ),
    GetPage(
      name: AppRoutesCl.declareInfo.path,
      page: () => DeclareInfoPage(),
    ),
    GetPage(
      name: AppRoutesCl.familyMemberDetail.path,
      page: () => FamilyMemberDetailPage(),
      binding: FamilyMemberDetailBinding(),
    ),
    GetPage(
      name: AppRoutesCl.declarationFormDetail.path,
      page: () => DeclarationFormDetailPage(),
    ),
    GetPage(
      name: AppRoutesCl.declarationList.path,
      page: () => DeclarationListPage(),
    ),
    GetPage(
      name: AppRoutesCl.viewPdf.path,
      page: () => ViewPdfPage(),
    ),
    GetPage(
      name: AppRoutesCl.forgotLogin.path,
      page: () => ForgotPasswordPage(),
    ),
    GetPage(
      name: AppRoutesCl.lookupC12.path,
      page: () => LookupC12Page(),
    ),
    GetPage(
      name: AppRoutesCl.selectStaff.path,
      page: () => SelectStaffPage(),
    ),
    GetPage(
      name: AppRoutesCl.notification.path,
      page: () => NotificationPage(),
    ),
    GetPage(
      name: AppRoutesCl.profile.path,
      page: () => ProfilePage(),
    ),
    GetPage(
      name: AppRoutesCl.registerService.path,
      page: () => RegisterServicePage(),
    ),
    GetPage(
      name: AppRoutesCl.registerCode.path,
      page: () => RegisterCodePage(),
    ),
    GetPage(
      name: AppRoutesCl.changeBaseUrl.path,
      page: () => const ChangeBaseUrlPage(),
    ),
    GetPage(
      name: AppRoutesCl.declareInfo607.path,
      page: () => DeclareInfo607Page(),
    ),
    GetPage(
      name: AppRoutesCl.declareInfo630a.path,
      page: () => DeclareInfo630aPage(),
    ),
    GetPage(
      name: AppRoutesCl.otherInfo.path,
      page: () => OtherInfoPage(),
    ),
  ];
}
