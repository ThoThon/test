import 'dart:io';

import 'package:image_picker/image_picker.dart';

import '../../certificate_list/models/register_request.dart';
import '../../declaration_tax_code/ui/ui_src.dart';
import 'controller_src.dart';

extension RegisterInfoTabControllerICare on TransactionControllerICare {
  Future<void> getProvince() async {
    await fetchListProvince();
    await fetchListSocialAgency();
    if (itemInfoCompany.representative.isNotEmpty) {
      representativeController.text = itemInfoCompany.representative;
    } else {
      representativeController.text = itemInfoCompany.signer;
    }
    phoneContactController.text = itemInfoCompany.contactPhone;
    emailContactController.text = itemInfoCompany.email;
    isContentInfoEdit.value = representativeController.text.isNotEmpty &&
        phoneContactController.text.isNotEmpty &&
        emailContactController.text.isNotEmpty;
  }

  Future<void> pickMultipleImages() async {
    try {
      final List<XFile> images = await picker.pickMultiImage(
        maxHeight: 60,
        maxWidth: 60,
        imageQuality: 80,
      );
      if (images.isNotEmpty) {
        listImage.addAll(images);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> getImageFromCamera() async {
    try {
      final XFile? imageCamera = await picker.pickImage(
        source: ImageSource.camera,
        maxHeight: 60,
        maxWidth: 60,
        imageQuality: 80,
      );
      if (imageCamera != null) {
        listImage.add(imageCamera);
      }
    } catch (e) {
      logger.e(e);
    }
  }

  String getImageSize(File imageFile) {
    final int sizeImageKb = imageFile.lengthSync();
    final double sizeInKB = sizeImageKb / 1024;
    return '${sizeInKB.toStringAsFixed(2)}Kb';
  }

  void removeImage(int index) {
    listImage.removeAt(index);
  }

  Future<void> fetchListProvince() async {
    await callAPIList(
      isRefresh: false,
      functionAPI: registerInfoTabRepository.getListProvince(),
      listResponse: listProvince,
    );
    if (itemInfoCompany.unitCode.isNotEmpty) {
      if (itemInfoCompany.provinceCode.isNotEmpty && listProvince.isNotEmpty) {
        for (var item in listProvince) {
          if (item.provinceCode == itemInfoCompany.provinceCode) {
            selectedProvince.value = item;
            break;
          }
        }
      }
    }
  }

  Future<void> fetchListDistrict(String provinceCode) async {
    try {
      if (currentSelectedProvince.value != provinceCode) {
        listDistrict.clear();
        listWard.clear();
        selectedDistrict.value = null;
        selectedWard.value = null;
        currentSelectedProvince.value = provinceCode;
        await callAPIList(
          isRefresh: false,
          functionAPI: registerInfoTabRepository.getListDistrict(provinceCode),
          listResponse: listDistrict,
        );
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> fetchListWard(
    String provinceCode,
    String districtCode,
  ) async {
    try {
      if (currentSelectedDistrict.value != districtCode) {
        listWard.clear();
        selectedWard.value = null;
        currentSelectedDistrict.value = districtCode;
        await callAPIList(
          isRefresh: false,
          functionAPI: registerInfoTabRepository.getListWard(
            provinceCode,
            districtCode,
          ),
          listResponse: listWard,
        );
      }
    } catch (e) {
      logger.e(e);
    }
  }

  Future<void> fetchListSocialAgency() async {
    listSocialAgency.clear();
    selectedSocialAgency.value = null;
    await callAPIList(
      isRefresh: false,
      functionAPI: registerInfoTabRepository.getSocialAgency(
        administrativeCode: itemInfoCompany.unitCode.isNotEmpty
            ? selectedProvince.value!.administrativeCode
            : "101",
      ),
      listResponse: listSocialAgency,
    );
    if (itemInfoCompany.districtCode.isNotEmpty &&
        listSocialAgency.isNotEmpty) {
      for (var item in listSocialAgency) {
        //districtCode trong itemInfoCompany là mã cơ quan BHXH
        if (item.socialAgencyCode == itemInfoCompany.districtCode) {
          selectedSocialAgency.value = item;
          break;
        }
      }
    }
  }

  void validateAndSubmit() {
    if (!formKeyTabGeneral.currentState!.validate()) {
      return changeInfoTab(0);
    }
    if (!formKeyTabRegister.currentState!.validate()) {
      return changeInfoTab(1);
    }
    if (itemInfoCompany.unitCode.isEmpty) {
      if (listImage.isEmpty) {
        return changeInfoTab(1);
      }
    }
    final imageFilePath = listImage.map((x) => x.path).toList();
    final registerModel = RegisterRequest(
      agencyCode: selectedSocialAgency.value?.socialAgencyCode ?? "",
      agencyName: selectedSocialAgency.value?.socialAgencyName ?? "",
      businessRegistrationAddress: addressRegisterController.text,
      companyAddress: addressTransactionController.text,
      companyName: companyNameController.text,
      email: emailContactController.text,
      idCompany: itemInfoCompany.orgId,
      phone: phoneController.text,
      taxCode: taxCodeController.text,
      transactionPerson: representativeController.text,
      imageFilePath: itemInfoCompany.unitCode.isEmpty ? imageFilePath : null,
      businessIndustry: itemInfoCompany.unitCode.isEmpty
          ? businessIndustryController.text
          : null,
      receivingDistrict: itemInfoCompany.unitCode.isEmpty
          ? selectedDistrict.value?.districtCode
          : null,
      receivingMethod: itemInfoCompany.unitCode.isEmpty ? "DT" : null,
      receivingProvince: itemInfoCompany.unitCode.isEmpty
          ? selectedProvince.value?.provinceCode
          : null,
      receivingWard: itemInfoCompany.unitCode.isEmpty
          ? selectedWard.value?.wardCode
          : null,
      unitCode:
          itemInfoCompany.unitCode.isNotEmpty ? unitCodeController.text : null,
    );

    Get.toNamed(
      AppRoutes.listCertificate.path,
      arguments: registerModel,
    );
  }

  void changeInfoTab(int index) {
    indexedStackInfoTab.value = index;
  }
}
