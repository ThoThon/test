import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

class UnitInfoControllerImpICare extends UnitInfoController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getAccountInfo();
  }

  @override
  void onClose() {
    taxCodeController.dispose();
    unitNameController.dispose();
    unitCodeController.dispose();
    socialAgencyNameCtrl.dispose();
    socialAgencyCodeCtrl.dispose();
    addressRegisterController.dispose();
    addressTransactionController.dispose();
    // nameRepresentController.text
    positionController.dispose();
    personTransactionController.dispose();
    phoneContactController.dispose();
    emailContactController.dispose();
    super.onClose();
  }

  void fetchDataAccountInfo() {
    taxCodeController.text = accountInfoModel?.taxCode ?? '';
    unitNameController.text = accountInfoModel?.tenToChuc ?? '';
    unitCodeController.text = accountInfoModel?.maDonVi ?? '';
    socialAgencyNameCtrl.text = accountInfoModel?.tenCoQuanQuanLy ?? '';
    socialAgencyCodeCtrl.text = accountInfoModel?.maCoQuanQuanLy ?? '';
    addressRegisterController.text = accountInfoModel?.diaChiDk ?? '';
    addressTransactionController.text = accountInfoModel?.diaChi ?? '';
    // nameRepresentController.text
    positionController.text = accountInfoModel?.jobTitle ?? '';
    personTransactionController.text = accountInfoModel?.tenNguoiKy ?? '';
    phoneContactController.text = accountInfoModel?.dienThoai ?? '';
    emailContactController.text = accountInfoModel?.mailLienLac ?? '';
  }

  Future<void> getAccountInfo() async {
    callAPIBE(
      isOverlay: false,
      isShowLoading: true,
      functionAPI: unitInfoRepository.getAccountInfo(),
      functionSuccess: (result) {
        accountInfoModel = result;
        fetchDataAccountInfo();
        logger.d(accountInfoModel?.taxCode ?? '');
      },
    );
  }

  void updateAccountInfo() {
    ShowDialog.showDialogConfirm(
      title: LocaleKeys.dialog_updateSuccess.tr,
      textBtnRight: "Quay lại",
    );
  }
}
