import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../base_app/controllers_base/base_controller/base_controller.src.dart';
import '../../../shares/widgets/dialog/dialog.src.dart';
import '../nfc_dialog/nfc_dialog.dart';
import '../nfc_dialog/nfc_dialog_controller.dart';

class NfcController extends BaseGetxController {
  final maybeContinue = false.obs;
  // late NfcRepository nfcRepository;

  @override
  void onInit() {
    // nfcRepository = NfcRepository(this);
    super.onInit();
  }

  Future<void> funcCheckIn(Widget child) async {
    Get.dialog(
      child,
      barrierDismissible: false,
    );
  }

  Future<void> scanNFC() async {
    if (GetPlatform.isIOS) {
      NfcDialogController nfcDialogController = Get.put(NfcDialogController());
      await nfcDialogController.scanNFC();
    } else if (GetPlatform.isAndroid) {
      ShowDialog.funcOpenDialog(const NfcDialog());
    }
  }

  Future<void> getInfoORC() async {
    // Get.toNamed(AppRoutes.routeAwaitOCRData);
  }
}
