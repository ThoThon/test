import 'dart:async';

import '../../../base_app/base_app.src.dart';
import '../../src.dart';
import '../models/nfc_request_model.dart';

class NfcDialogController extends BaseGetxController {
  final AppController appController = Get.find<AppController>();

  // final NfcController nfcController = Get.find();
  //
  // late DataOcrModel dataOcrModel;
  // UserModel userModel = UserModel();
  String? idDocument;
  DateTime? dateOfBirth;
  DateTime? dateOfExpiry;
  // Rx<MrtdData>? mrtdData;
  SendNfcRequestModel sendNfcRequestModel = SendNfcRequestModel();
  RxBool readComplete = false.obs;
  // final NfcProvider nfc = NfcProvider();
  final scrollController = ScrollController();
  RxBool isReading = false.obs;
  bool isCloseDialog = false;

  RxInt processQuantity = 0.obs;
  int maxProcess = 10;

  @override
  Future<void> onInit() async {
    if (GetPlatform.isAndroid) {
      await scanNFC();
    }

    super.onInit();
  }

  // @override
  // void onClose() {
  //   print("text :dispose");
  //   super.dispose();
  // }

  Future<void> scanNFC() async {
    // dataOcrModel = Get.arguments;
    // setupData();
    // userModel = UserModel();
    // await readMRTD();
    // await readMRTD();
    if (sendNfcRequestModel.number != null) {
      if (Get.isDialogOpen == true) {
        Get.back();
      }
      Get.toNamed(
        AppRoutes.routeNfcInformationUser.path,
        arguments: sendNfcRequestModel,
      );
    } else {
      if (!isCloseDialog) {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
        showSnackBar('Quét nfc bị lỗi vui lòng thử lại');
      }
    }
    sendNfcRequestModel = SendNfcRequestModel();
  }

  Future<void> closeNfc() async {
    showLoading();
    if (Get.isDialogOpen ?? false) {
      Get.back();
    }
    isCloseDialog = true;
    // await nfc.disconnect();
    isReading.value = false;
    hideLoading();
  }

  String removeSpecialCharacters(String input) {
    return input.replaceAll(
        RegExp(
            r'[^\w\s\r\f\t,:/-áàảãạăắằẳẵặâấầẩẫậéèẻẽẹêếềểễệíìỉĩịóòỏõọôốồổỗộơớờởỡợúùủũụưứừửữựýỳỷỹỵÁÀẢÃẠĂẮẰẲẴẶÂẤẦẨẪẬÉÈẺẼẸÊẾỀỂỄỆÍÌỈĨỊÓÒỎÕỌÔỐỒỔỖỘƠỚỜỞỠỢÚÙỦŨỤƯỨỪỬỮỰÝỲỶỸỴđĐ]'),
        '');
  }
}
