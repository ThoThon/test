import 'dart:async';

import 'package:html_unescape/html_unescape.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../icare/icare.src.dart';
import '../../src.dart';
import '../certificate_src.dart';

class ListCertificateControllerICare extends BaseRefreshGetxController {
  final listCertificate = [].obs;

  final listSign = <SignIcare>[].obs;

  late final certificateRepository = CertificateRepositoryICare(this);

  final Rx<CertIcare?> itemSelected = Rx<CertIcare?>(null);

  CertInfo? certInfo;

  late final RegisterRequest registerItem;

  @override
  void onInit() async {
    super.onInit();
    await fetchListCertificateInit();
    getArg();
  }

  void getArg() {
    if (Get.arguments != null && Get.arguments is RegisterRequest) {
      registerItem = Get.arguments;
    }
  }

  Future<void> fetchListCertificateInit() async {
    try {
      showLoading();
      if (MockSdk().isMock) {
        await fetchListCertificate();
      } else {
        await fetchListCertificateSDK();
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoading();
    }
  }

  Future<void> fetchListCertificateSDK() async {
    var listCertsResponseIcare = await IcareModules.icareModulesData
        .listCerts(ListCertsResponseIcare.fromJson, ListCertsRequestIcare());
    if (listCertsResponseIcare != null) {
      listCertificate.addAll(listCertsResponseIcare.certs);
    } else {
      ShowDialog.showDialogError(
        title: LocaleKeys.dialog_notification.tr,
        missingFields: [listCertsResponseIcare?.errorMessage ?? ""],
      );
    }
  }

  Future<void> goToAwaitConfirmSignPage(String serialSelected) async {
    if (MockSdk().isMock) {
      await getCertInfoIcare(serialSelected);
    } else {
      await getCertInfoSDK(serialSelected);
    }
    if (certInfo != null) {
      gotoAwaitConfirmSignature();
    }
  }

  Future<void> goToVerifyCertPage(String serialSelected) async {
    if (MockSdk().isMock) {
      await getCertInfoIcare(serialSelected);
    } else {
      await getCertInfoSDK(serialSelected);
    }
    if (certInfo != null) {
      Get.toNamed(
        AppRoutesIcare.verifyCertificate.path,
        arguments: certInfo,
      )?.then(
        (value) async {
          listCertificate.clear();
          await fetchListCertificateSDK();

          /// Cập nhật CertICare để isActive được cập nhật lại
          itemSelected.value = listCertificate.firstWhere(
            (cert) => cert.serial == serialSelected,
            orElse: () => itemSelected.value,
          );
        },
      );
    }
  }

  Future<void> getCertInfoSDK(String serialSelected) async {
    var certInfoResponseIcare = await IcareModules.icareModulesData.cerInfo(
        CertInfoResponseIcare.fromJson,
        CertInfoRequestIcare(serial: serialSelected));
    if (certInfoResponseIcare != null) {
      certInfo = certInfoResponseIcare.certInfo;
    } else {
      ShowDialog.showDialogError(
        title: LocaleKeys.dialog_notification.tr,
        missingFields: [certInfoResponseIcare?.errorMessage ?? ""],
      );
    }
  }

  /// Mock data chạy từ icare
  Future<void> getCertInfoIcare(String serialSelected) async {
    CertInfoResponseIcare certInfoResponseIcare =
        MockSdk().mockCertInfoResponseIcare();
    certInfo = certInfoResponseIcare.certInfo;
  }

  Future<void> fetchListCertificate() async {
    ListCertsResponseIcare listCertsResponseIcare =
        MockSdk().mockListCertsResponseIcare();

    // Mock data chạy từ icare
    listCertificate.addAll(listCertsResponseIcare.certs);
  }

  RegisterRequest get registerItemArguments => RegisterRequest(
        taxCode: registerItem.taxCode,
        idCompany: registerItem.idCompany,
        companyName: registerItem.companyName,
        businessRegistrationAddress: registerItem.businessRegistrationAddress,
        companyAddress: registerItem.companyAddress,
        phone: registerItem.phone,
        agencyCode: registerItem.agencyCode,
        agencyName: registerItem.agencyName,
        transactionPerson: registerItem.transactionPerson,
        certBase64: convertStringHtml(certInfo!.raw!),
        email: registerItem.email,
        serial: certInfo?.serial ?? '',
        subjectInfo: convertStringHtml(certInfo?.subject ?? ''),
        validDate: convertDateStringToString(certInfo!.validFrom!, PATTERN_5),
        expiredDate: convertDateStringToString(certInfo!.validTo!, PATTERN_5),
        imageFilePath: registerItem.imageFilePath ?? [],
        businessIndustry: registerItem.businessIndustry ?? '',
        receivingMethod: registerItem.receivingMethod ?? '',
        receivingProvince: registerItem.receivingProvince ?? '',
        receivingDistrict: registerItem.receivingDistrict ?? '',
        receivingWard: registerItem.receivingWard ?? '',
        unitCode: registerItem.unitCode ?? '',
      );

  void gotoAwaitConfirmSignature() {
    if (Assets.isFromModules) {
      Get.toNamed(
        AppRoutesIcare.awaitConfirmSignature.path,
        arguments: registerItemArguments,
      );
    } else {
      Get.toNamed(
        AppRoutesIcare.awaitConfirmSignature.path,
        arguments: registerItemArguments,
      );
    }
  }

  String? extractTaxCodeWithRegExp(String subjectInfo) {
    final regExp = RegExp(r'(MSTCN|CCCD|MST):([^,]+)');
    final match = regExp.firstMatch(convertStringHtml(subjectInfo) ?? '');
    return match?.group(2);
  }

  String? extractCNWithRegExp(String cn) {
    final regExp = RegExp(r'CN=([^,]+)');
    final match = regExp.firstMatch(convertStringHtml(cn) ?? '');
    return match?.group(1);
  }

  String? convertStringHtml(String certBase64) {
    var regExp = HtmlUnescape().convert(certBase64);
    return regExp;
  }

  @override
  Future<void> onLoadMore() async {}

  @override
  Future<void> onRefresh() async {
    listCertificate.clear();
    await fetchListCertificateInit();
    refreshController.refreshCompleted();
  }
}
