import 'dart:async';

import '../../../shares/widgets/dialog/dialog_utils.dart';
import '../../certificate_list/models/register_request.dart';
import '../../certificate_list/repository/repository_src.dart';
import '../../icare/icare.src.dart';
import '../../src.dart';

class AwaitConfirmSignatureControllerICare extends BaseGetxControllerIcare {
  late final certificateRepository = CertificateRepositoryICare(this);

  final listSign = <SignIcare>[].obs;

  Timer? _timer;

  late final RegisterRequest registerItem;

  bool isFetchList = true;

  final isHaveButton = true;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null && Get.arguments is RegisterRequest) {
      registerItem = Get.arguments;
    }
    firstRegister();
    fetchListSign();
    // Tạm thời cmt vì chưa tối ưu
    timerCallApi();
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }

  Future<void> firstRegister() async {
    showLoading();
    await callAPIBE(
      functionAPI: certificateRepository.registerSocial(
        isRegisterFirst: (registerItem.unitCode ?? '').isEmpty,
        request: registerItem,
      ),
      functionSuccess: (result) {
        _timer?.cancel();
        ShowDialog.showDialogConfirm(
          name: 'dialogConfirm',
          textBtnRight: LocaleKeys.dialog_history.tr,
          isActiveBack: false,
          onPressed: () {
            Get.toNamed(
              AppRoutesIcare.historyTransaction.path,
              arguments: {
                'item': registerItem,
                'isHaveBtn': isHaveButton,
              },
            );
          },
          funcBack: () {
            Get.until(
              (route) =>
                  route.settings.name == AppRoutesIcare.declarationTaxCode.path,
            );
          },
        );
      },
    );
    hideLoading();
  }

  Future<void> fetchListSignSDK() async {
    var listSignResponseIcare = await IcareModules.icareModulesData.listSign(
      ListSignResponseIcare.fromJson,
      ListSignRequestIcare(pageSize: 10, pageNumber: 1),
    );

    if (listSignResponseIcare != null) {
      listSign.clear();
      listSign.addAll(listSignResponseIcare.signRequests);
    } else {
      ShowDialog.showDialogError(
        title: LocaleKeys.dialog_notification.tr,
        missingFields: [listSignResponseIcare?.errorMessage ?? ""],
      );
    }
  }

  ///Mock data chạy từ icare
  Future<void> fetchListSignIcare() async {
    // listSign.clear();
    await Future.delayed(const Duration(seconds: 3));
    var listSignResponseIcare = MockSdk().mockListSignResponseIcare();
    listSign.clear();
    listSign.addAll(listSignResponseIcare.signRequests);
  }

  void timerCallApi() {
    _timer = Timer.periodic(
      Duration(seconds: 3),
      (timer) async {
        if (isFetchList) {
          await fetchListSign();
        }
      },
    );
  }

  Future<void> fetchListSign() async {
    showLoading();
    if (MockSdk().isMock) {
      await fetchListSignIcare();
    } else {
      await fetchListSignSDK();
    }
    hideLoading();
  }

  Future<void> confirmSign(SignIcare item) async {
    isFetchList = false;
    await Get.toNamed(
      AppRoutesIcare.confirmCode.path,
      arguments: item,
    );
    isFetchList = true;

    if (MockSdk().isMock) {
      ShowDialog.showDialogConfirm(
        name: 'dialogConfirm',
        textBtnRight: LocaleKeys.dialog_history.tr,
        onPressed: () {
          Get.toNamed(
            AppRoutesIcare.historyTransaction.path,
            arguments: {
              'item': registerItem,
              'isHaveBtn': isHaveButton,
            },
          );
        },
        funcBack: () {
          Get.offAllNamed(
            AppRoutesIcare.declarationTaxCode.path,
          );
        },
        isActiveBack: false,
      );
    } else {
      await fetchListSign();
    }
  }
}
