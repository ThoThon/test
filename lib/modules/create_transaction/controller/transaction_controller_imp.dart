import 'package:v_bhxh/modules/create_transaction/controller/register_info_tab_controller.dart';
import 'package:v_bhxh/modules/create_transaction/controller/transaction_controller.dart';
import 'package:v_bhxh/modules/mock_data/mock_sdk.dart';

import '../../declaration_tax_code/ui/ui_src.dart';

class TransactionControllerImpICare extends TransactionControllerICare {
  @override
  Future<void> onInit() async {
    getArg();
    await getProvince();
    if (MockSdk().isMock) {
      mockData();
    }

    fetchInfoData();
    super.onInit();
  }

  void getArg() {
    if (Get.arguments != null && Get.arguments is InfoCompanyResponse) {
      itemInfoCompany = Get.arguments;
    }
  }

  @override
  void onClose() {
    taxCodeController.dispose();
    companyNameController.dispose();
    phoneController.dispose();
    unitCodeController.dispose();
    addressRegisterController.dispose();
    addressTransactionController.dispose();
    nameRepresentController.dispose();
    positionController.dispose();
    representativeController.dispose();
    phoneContactController.dispose();
    emailContactController.dispose();
    fileIncludeController.dispose();
    listImage.clear();
    super.onClose();
  }

  void fetchInfoData() {
    taxCodeController.text = itemInfoCompany.taxCode;
    companyNameController.text = itemInfoCompany.orgName;
    phoneController.text = itemInfoCompany.phoneNumber;
    unitCodeController.text = itemInfoCompany.unitCode;
    addressRegisterController.text = itemInfoCompany.registedAddress;
    addressTransactionController.text = itemInfoCompany.address;
    nameRepresentController.text = itemInfoCompany.representative;
    positionController.text = itemInfoCompany.title;

    if (itemInfoCompany.unitCode.isNotEmpty) {
      isUnitInfoEdit.value = taxCodeController.text.isEmpty ||
          companyNameController.text.isEmpty ||
          phoneController.text.isEmpty ||
          unitCodeController.text.isEmpty;
    } else {
      isUnitInfoEdit.value = taxCodeController.text.isEmpty ||
          companyNameController.text.isEmpty ||
          phoneController.text.isEmpty ||
          businessIndustryController.text.isEmpty;
    }
    isAddressInfoEdit.value = addressRegisterController.text.isEmpty ||
        addressTransactionController.text.isEmpty;
    isRepresentInfoEdit.value =
        nameRepresentController.text.isEmpty || positionController.text.isEmpty;
  }

  void mockData() {
    businessIndustryController.text = 'Nghề test';

    update();
  }
}
