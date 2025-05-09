import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog.src.dart';

class UnitInfoControllerImpICare extends UnitInfoController {
  @override
  void onInit() {
    super.onInit();
    fetchDataAccountInfo();
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
    final accountInfo = appController.accountInfoModel;
    taxCodeController.text = accountInfo?.taxCode ?? '';
    unitNameController.text = accountInfo?.tenToChuc ?? '';
    unitCodeController.text = accountInfo?.maDonVi ?? '';
    socialAgencyNameCtrl.text = accountInfo?.tenCoQuanQuanLy ?? '';
    socialAgencyCodeCtrl.text = accountInfo?.maCoQuanQuanLy ?? '';
    addressRegisterController.text = accountInfo?.diaChiDk ?? '';
    addressTransactionController.text = accountInfo?.diaChi ?? '';
    // nameRepresentController.text
    positionController.text = accountInfo?.jobTitle ?? '';
    personTransactionController.text = accountInfo?.tenNguoiKy ?? '';
    phoneContactController.text = accountInfo?.dienThoai ?? '';
    emailContactController.text = accountInfo?.mailLienLac ?? '';
  }

  void updateAccountInfo() {
    ShowDialog.showDialogConfirm(
      title: LocaleKeys.dialog_updateSuccess.tr,
      textBtnRight: "Quay lại",
      activeIcon: false,
      onPressed: () {},
    );
  }
}
