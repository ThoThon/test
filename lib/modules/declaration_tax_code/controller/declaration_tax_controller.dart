import 'package:v_bhxh/modules/src.dart';

import '../../icare/icare.src.dart';

class DeclarationTaxControllerICare extends BaseGetxControllerIcare {
  final listData = <TaxModelResponse>[].obs;
  late final declarationTaxCodeRepository =
      DeclarationTaxCodeRepositoryICare(this);

  @override
  Future<void> onInit() async {
    super.onInit();

    await fetchListTaxCode();

    // await getToken();
  }

  Future<void> fetchListTaxCode() async {
    //Tạm thời fix cứng email khi chạy độc lập
    await callAPIList<TaxModelResponse>(
      functionAPI: declarationTaxCodeRepository.fetchListTaxCode(
        email: Assets.isFromModules
            ? IcareModules.icareModulesData.emailFromCA
            : MockSdk().mockEmail,
      ),
      listResponse: listData,
    );
  }
}
