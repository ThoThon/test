import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/modules/info_unit/models/update_account_info_request.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

class UnitInfoControllerImpICare extends UnitInfoController {
  @override
  void onInit() {
    super.onInit();
    accountInfo = AppData.instance.accountInfoModel.value;
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
    nameRepresentController.dispose();
    positionController.dispose();
    personTransactionController.dispose();
    phoneContactController.dispose();
    emailContactController.dispose();
    basicSalaryController.dispose();
    super.onClose();
  }

  void fetchDataAccountInfo() {
    taxCodeController.text = accountInfo?.taxCode ?? '';
    unitNameController.text = accountInfo?.tenToChuc ?? '';
    unitCodeController.text = accountInfo?.maDonVi ?? '';
    socialAgencyNameCtrl.text = accountInfo?.tenCoQuanQuanLy ?? '';
    socialAgencyCodeCtrl.text = accountInfo?.maCoQuanQuanLy ?? '';
    addressRegisterController.text = accountInfo?.diaChiDk ?? '';
    addressTransactionController.text = accountInfo?.diaChi ?? '';
    nameRepresentController.text = accountInfo?.tenNguoiKeKhai ?? '';
    positionController.text = accountInfo?.jobTitle ?? '';
    personTransactionController.text = accountInfo?.tenNguoiKy ?? '';
    phoneContactController.text = accountInfo?.telReceiver ?? '';
    emailContactController.text = accountInfo?.mailLienLac ?? '';
    basicSalaryController.text = CurrencyUtils.formatCurrencyForeign(
      accountInfo?.luongCoSo,
      isDot: true,
      maxLengthNum: 17,
    );
    selectedRegion.value = getRegionByCode(accountInfo?.maVung);
    selectedMethod.value = getPaymenteMethod(accountInfo?.phuongThucDong);
    selectedReceive.value = getReceiveResult(accountInfo?.ptNhanKq);
  }

  Future<void> updateAccountInfo() async {
    callAPIBE(
      isOverlay: true,
      functionAPI: unitInfoRepository.updateAccountInfo(
        UpdateAccountInfoRequest(
          toChucId: accountInfo?.toChucId ?? "",
          tenToChuc: unitNameController.text,
          diaChiDangKy: addressRegisterController.text,
          diaChi: addressTransactionController.text,
          mailLienLac: emailContactController.text,
          tenNguoiKy: personTransactionController.text,
          telReceiver: phoneContactController.text,
          jobTitle: positionController.text,
          loaiDoiTuong: accountInfo?.loaiDoiTuong ?? "",
          tenNguoiKeKhai: nameRepresentController.text,
          luongCoSo: int.parse(basicSalaryController.text.replaceAll('.', '')),
          phuongThucDong: selectedMethod.value!.month,
          ptNhanKq: selectedReceive.value!.receive.tr,
          maVung: selectedRegion.value!.codeRegion,
        ),
      ),
      functionSuccess: (result) {
        ShowDialog.showDialogConfirm(
          title: LocaleKeys.dialog_updateSuccess.tr,
          textBtnRight: LocaleKeys.unitInfo_home.tr,
          activeIcon: true,
          onPressed: () async {
            await _getAccountInfo();
            Get.offAllNamed(
              AppRoutes.pageBuilder.path,
            );
          },
          funcBack: () async {
            await _getAccountInfo();
            Get.back();
          },
        );
      },
      functionFail: (result) {
        showSnackBar("Có lỗi xảy ra, vui lòng thử lại");
      },
    );
  }

  Future<void> _getAccountInfo() async {
    try {
      final res = await unitInfoRepository.getAccountInfo();
      if (res.code == AppConst.statusCodeSuccess && res.result != null) {
        AppData.instance.accountInfoModel.value = res.result;
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
