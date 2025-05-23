import 'package:v_bhxh/modules/nfc/models/nfc_request_model.dart';

import '../../../base_app/controllers_base/app_controller/app_controller.dart';
import '../../../base_app/controllers_base/base_controller/base_controller.dart';
import '../../../shares/date/date_utils.dart';
import '../../../shares/package/export_package.dart';

class NfcInformationUserController extends BaseGetxController {
  String? dateOfBirth;
  String? dateOfExpiry;
  String? image;
  SendNfcRequestModel sendNfcRequestModel = SendNfcRequestModel();
  AppController appController = Get.find<AppController>();
  
  /// TODO
  void setupData() {
    if (Get.arguments != null) {
      if (Get.arguments is SendNfcRequestModel) {
        sendNfcRequestModel = Get.arguments;
        if (sendNfcRequestModel.infoToVNeID) {
          dateOfBirth = sendNfcRequestModel.dob;
          dateOfExpiry = sendNfcRequestModel.doe;
        } else {
          dateOfBirth = convertDateToString(
            convertStringToDate(
              sendNfcRequestModel.dob ?? '',
              PATTERN_5,
            ),
            PATTERN_1,
          );
          dateOfExpiry = convertDateToString(
            convertStringToDate(
              sendNfcRequestModel.doe ?? '',
              PATTERN_5,
            ),
            PATTERN_1,
          );
        }
        image = sendNfcRequestModel.file;
      }
    }
  }
}
