import 'package:v_bhxh/modules/icare/icare_modules.dart';
import 'package:v_bhxh/modules/icare/models/icare_model.src.dart';
import 'package:v_bhxh/modules/icare/models/sdk_ca/certs/verify_cert_request.dart';
import 'package:v_bhxh/modules/icare/models/sdk_ca/certs/verity_cert_response.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../shares/widgets/dialog/dialog.src.dart';

class VerityCertControllerICare extends BaseGetxController {
  late final CertInfo certInfo;

  @override
  void onInit() {
    super.onInit();
    getArg();
  }

  void getArg() {
    final arg = Get.arguments;
    if (arg != null && arg is CertInfo) {
      certInfo = arg;
    }
  }

  Future<void> verifyCertSDK(String serial) async {
    final verifyResponseIcare = await IcareModules.icareModulesData.verifyCert(
      VerifyCertResponseICare.fromJson,
      VerifyCertRequestICare(serial: serial),
    );
    if (verifyResponseIcare != null) {
      Get.back();
      showSnackBar(
        LocaleKeys.certificate_verifySuccessfully.tr,
        typeAction: AppConst.actionSuccess,
      );
    } else {
      ShowDialog.showDialogError(
        title: LocaleKeys.dialog_notification.tr,
        missingFields: [verifyResponseIcare?.errorMessage ?? ""],
      );
    }
  }
}
