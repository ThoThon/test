import 'package:v_bhxh/modules/src.dart';

import '../src.dart';

class IcareHomeController extends BaseGetxController {
  late InfoCompanyResponse itemCompany;
  late final HomepositoryICare homepositoryICare = HomepositoryICare(this);

  final isFromHome = false;
  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      itemCompany = Get.arguments;
    }
  }

  Object? getArguments(HomeEnum item) {
    switch (item) {
      case HomeEnum.register_transaction:
        return itemCompany;
      case HomeEnum.transaction_history:
        return itemCompany;
      // case HomeEnum.file_declaration:
      //   return "";
      // case HomeEnum.lookup_c12:
      //   return "";
    }
  }

  Future<void> fetchInfoCompany() async {
    if (Get.previousRoute != AppRoutes.declarationTaxCodeDetail.path) {
      final List<InfoCompanyResponse> listResponse = [];
      await callAPIList(
        functionAPI: homepositoryICare.fetchInfoCompany(itemCompany.taxCode),
        listResponse: listResponse,
      );

      final company = listResponse.firstWhereOrNull(
        (element) => element.orgId.contains(itemCompany.orgId),
      );
      if (company != null) {
        itemCompany = company;
      }
    }
  }
}
