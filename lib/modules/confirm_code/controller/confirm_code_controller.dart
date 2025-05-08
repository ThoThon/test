import 'dart:async';

import '../../icare/icare.src.dart';
import '../../src.dart';

class PinCodeControllerICare extends BaseGetxControllerIcare {
  late TextEditingController textEditingController = TextEditingController();
  late FocusNode pinCodeFocusNode;
  RxString pinCode = ''.obs;
  RxBool isVisibleTime = false.obs;
  RxString firstPinCode = ''.obs;

  SignIcare? signIcare;

  @override
  void onInit() {
    super.onInit();
    textEditingController.clear();
    pinCodeFocusNode = FocusNode();
    Future.delayed(const Duration(milliseconds: 300), () {
      pinCodeFocusNode.requestFocus();
    });
    if (Get.arguments != null && Get.arguments is SignIcare) {
      signIcare = Get.arguments;
    }
  }

  @override
  void onClose() {
    // pinCodeFocusNode.dispose();
    super.onClose();
  }

  void onPinCodeEntered(String value) async {
    await sendConfirmSign();
  }

  void updatePinUI() {
    update();
  }

  Future<void> sendConfirmSign() async {
    showLoading();
    if (MockSdk().isMock) {
      if (pinCode.value == "000000") {
        showSnackBar(
          LocaleKeys.awaitConfirmSign_comfirmSignSuccessfully.tr,
          typeAction: AppConst.actionSuccess,
        );
        Get.back();
      } else {
        textEditingController.clear();
        pinCodeFocusNode.requestFocus();
        showSnackBar(
          "Lỗi xác thực",
          typeAction: AppConst.actionFail,
        );
      }
    } else {
      logger.d(
        ConfirmSignRequestIcare(
          signRequestId: signIcare?.signRequestId,
          confirm: true,
          authId: signIcare?.authId,
          authData: signIcare?.authData,
          userPin: pinCode.value,
        ).toJson(),
      );
      final response = await IcareModules.icareModulesData.confirmSign(
        ConfirmSignResponseIcare.fromJson,
        ConfirmSignRequestIcare(
          signRequestId: signIcare?.signRequestId,
          confirm: true,
          authId: signIcare?.authId,
          authData: signIcare?.authData,
          userPin: pinCode.value,
        ),
      );
      logger.d(response);

      hideLoading();
      if (response == null) return;

      if (response.isSuccess) {
        Get.back();
        showSnackBar(
          LocaleKeys.awaitConfirmSign_comfirmSignSuccessfully.tr,
          typeAction: AppConst.actionSuccess,
        );
      } else {
        pinCodeFocusNode.requestFocus();
        textEditingController.clear();
        showSnackBar(
          response.errorMessage,
          typeAction: AppConst.actionFail,
        );
      }
    }
  }
}
