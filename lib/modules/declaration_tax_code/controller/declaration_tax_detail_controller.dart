import 'controller_src.dart';

class DeclarationTaxDetailControllerICare extends BaseGetxControllerIcare {
  final listDataDetail = [].obs;

  // final appControllerIcare = Get.put(AppControllerIcare());

  late final declarationTaxCodeRepository =
      DeclarationTaxCodeRepositoryICare(this);

  String? taxCode;

  final Rx<InfoCompanyResponse?> itemSelected = Rx<InfoCompanyResponse?>(null);

  @override
  void onInit() {
    super.onInit();
    if (Get.arguments != null) {
      taxCode = Get.arguments;
    }
    // appControllerIcare.onInit();
    fetchInfoCompany();
  }

  Future<void> fetchInfoCompany() async {
    await callAPIList(
      functionAPI: declarationTaxCodeRepository.fetchInfoCompany(taxCode ?? ''),
      listResponse: listDataDetail,
    );
  }

  bool compareTimeValid(String expiryDate) {
    final now = DateTime.now();
    final endDate = DateTime.parse(expiryDate);
    return endDate.isBefore(now);
  }
}
