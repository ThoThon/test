import 'package:v_bhxh/modules/nfc/models/nfc_request_model.dart';

import '../../../base_app/controllers_base/app_controller/app_controller.dart';
import '../../../base_app/controllers_base/base_controller/base_controller.dart';
import '../../../shares/package/export_package.dart';

class NfcInformationUserController extends BaseGetxController {
  String? dateOfBirth;
  String? dateOfExpiry;
  String? image;
  SendNfcRequestModel sendNfcRequestModel = SendNfcRequestModel();
  AppController appController = Get.find<AppController>();
  // late NfcRepository nfcRepository;
}
