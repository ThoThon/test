import 'package:get/get.dart';

import '../../../../base_app/controllers_base/base_controller/base_controller.src.dart';
import '../../../shares/widgets/dialog/dialog.src.dart';
import '../nfc_dialog/nfc_dialog.dart';
import '../nfc_dialog/nfc_dialog_controller.dart';

class NfcController extends BaseGetxController {
  final maybeContinue = false.obs;
  String? idDocument;

  @override
  void onInit() {
    if (Get.arguments != null) {
      idDocument = Get.arguments;
    }
    super.onInit();
  }

  Future<void> scanNFC() async {
    if (GetPlatform.isIOS) {
      NfcDialogController nfcDialogController = Get.put(NfcDialogController());
      await nfcDialogController.scanNFC();
    } else if (GetPlatform.isAndroid) {
      ShowDialog.funcOpenDialog(
        const NfcDialog(),
        idDocument,
      );
    }
  }
}
