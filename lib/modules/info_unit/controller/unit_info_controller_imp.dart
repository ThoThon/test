import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/info_unit/models/update_account_info_request.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/string_utils.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

class UnitInfoControllerImpICare extends UnitInfoController {
  @override
  void onInit() async {
    super.onInit();
    await _getAccountInfo();
    fetchDataAccountInfo();
    inputInfoIsEmpty();
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
    accountInfo = AppData.instance.accountInfo.value;
    taxCodeController.text = accountInfo?.taxCode ?? '';
    unitNameController.text = accountInfo?.tenToChuc ?? '';
    unitCodeController.text = accountInfo?.maDonVi ?? '';
    socialAgencyNameCtrl.text = accountInfo?.tenCoQuanQuanLy ?? '';
    socialAgencyCodeCtrl.text = accountInfo?.maCoQuanQuanLy ?? '';
    addressRegisterController.text = accountInfo?.diaChiDk ?? '';
    addressTransactionController.text = accountInfo?.diaChi ?? '';
    nameRepresentController.text = accountInfo?.tenNguoiKy ?? '';
    positionController.text = accountInfo?.jobTitle ?? '';
    personTransactionController.text = accountInfo?.tenNguoiKeKhai ?? '';
    phoneContactController.text = accountInfo?.telReceiver ?? '';
    emailContactController.text = accountInfo?.mailLienLac ?? '';
    basicSalaryController.text = CurrencyUtils.formatCurrencyForeign(
      accountInfo?.luongCoSo,
      isDot: true,
      maxLengthNum: 17,
    );
    selectedMethod.value = getPaymenteMethod(accountInfo?.phuongThucDong);
    selectedReceive.value = getReceiveResult(accountInfo?.ptNhanKq);
    originalInfo = _buildRequest();
  }

  bool get isInputUnchanged {
    return originalInfo == _buildRequest();
  }

  void handleCancelEdit() {
    if (isInputUnchanged) {
      isEditAll.value = false;
    } else {
      ShowDialog.showDialogConfirm2(
        borderColorButtonBack: const Color(0xFFBCC1CA),
        iconType: DialogIconType.note,
        title: LocaleKeys.dialog_cancelUpdate.tr,
        content: LocaleKeys.dialog_cancelUpdateDialog.tr,
        exitTitle: LocaleKeys.unitInfo_cancel.tr,
        confirmTitle: LocaleKeys.unitInfo_continue.tr,
        backgroundColorBack: Colors.white,
        textStyleBack:
            AppTextStyle.font14Re.copyWith(color: AppColors.basicBlack),
        textStyleConfirm: AppTextStyle.font14Re,
        onCancel: () {
          fetchDataAccountInfo();
          isEditAll.value = false;
        },
        onConfirm: () {},
      );
    }
  }

  Future<void> updateAccountInfo() async {
    try {
      final request = _buildRequest();

      // Nếu có bất kỳ 1 input nào null thì sẽ dừng ở đây
      if (inputIsNotValid() == true) {
        return inputInfoIsEmpty();
      }
      showLoadingOverlay();
      final response = await unitInfoRepository.updateAccountInfo(request);
      if (response.isSuccess) {
        ShowDialog.showDialogConfirm2(
          title: LocaleKeys.dialog_updateSuccess.tr,
          iconType: DialogIconType.success,
          showConfirmButton: false,
          content: LocaleKeys.dialog_updateSuccessDialog.tr,
          exitTitle: LocaleKeys.dialog_close.tr,
          isActiveBack: false,
          onCancel: () async {
            await _getAccountInfo();
            await _getToTalNotiUnread();
            fetchDataAccountInfo();
            isEditAll.value = false;
          },
        );
      } else {
        ShowDialog.showDialogConfirm2(
          title: LocaleKeys.dialog_updateFailure.tr,
          iconType: DialogIconType.failure,
          showConfirmButton: false,
          content: LocaleKeys.dialog_updateFailureDialog.tr,
          exitTitle: LocaleKeys.dialog_close.tr,
          isActiveBack: false,
          onCancel: () async {
            await _getAccountInfo();
            await _getToTalNotiUnread();
            Get.offAllNamed(
              AppRoutesCl.home.path,
            );
          },
        );
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  UpdateAccountInfoRequest _buildRequest() {
    return UpdateAccountInfoRequest(
      toChucId: accountInfo?.toChucId ?? "",
      tenToChuc: unitNameController.text,
      diaChiDangKy: addressRegisterController.text,
      diaChi: addressTransactionController.text,
      mailLienLac: emailContactController.text,
      tenNguoiKy: nameRepresentController.text,
      telReceiver: phoneContactController.text,
      jobTitle: positionController.text,
      loaiDoiTuong: accountInfo?.loaiDoiTuong ?? "",
      tenNguoiKeKhai: personTransactionController.text,
      luongCoSo:
          int.tryParse(basicSalaryController.text.replaceAll('.', '')) ?? 0,
      phuongThucDong: selectedMethod.value!.month,
      ptNhanKq: selectedReceive.value!.receive.tr,
    );
  }

  Future<void> _getAccountInfo() async {
    showLoadingOverlay();
    try {
      final res = await unitInfoRepository.getAccountInfo();
      if (res.code == AppConst.statusCodeSuccess && res.result != null) {
        AppData.instance.accountInfo.value = res.result;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> _getToTalNotiUnread() async {
    try {
      final res = await unitInfoRepository.getToTalNotiUnread();
      if (res.isSuccess && res.result != null) {
        AppData.instance.totalUnread.value = res.result!;
      }
    } catch (e) {
      logger.d(e);
    }
  }

  bool unitInfoIsNotValid() {
    return unitNameController.text.trim().isEmpty;
  }

  bool addressInfoIsNotValid() {
    return addressRegisterController.text.trim().isEmpty ||
        addressTransactionController.text.trim().isEmpty;
  }

  bool representInfoIsNotValid() {
    return nameRepresentController.text.trim().isEmpty ||
        positionController.text.trim().isEmpty;
  }

  bool traderInfoIsNotValid() {
    return personTransactionController.text.trim().isEmpty ||
        phoneContactController.text.trim().isEmpty ||
        emailContactController.text.trim().isEmpty ||
        !emailContactController.text.isEmailValid;
  }

  bool otherInfoIsNotValid() {
    return selectedMethod.value == null ||
        basicSalaryController.text.trim().isEmpty ||
        selectedReceive.value == null;
  }

  // Check các input nếu 1 input null thì trả về true
  void inputInfoIsEmpty() {
    isUnitInfoEdit.value = unitInfoIsNotValid();
    isAddressInfoEdit.value = addressInfoIsNotValid();
    isRepresentInfoEdit.value = representInfoIsNotValid();
    isTraderInfoEdit.value = traderInfoIsNotValid();
    isOtherInfoEdit.value = otherInfoIsNotValid();
  }

  // Vì formKey không check được text khi user chọn card view nên phải check thủ công
  // Kiểm tra đầu vào đủ hết thì mới cho gọi api Update
  bool inputIsNotValid() {
    return unitInfoIsNotValid() ||
        addressInfoIsNotValid() ||
        representInfoIsNotValid() ||
        traderInfoIsNotValid() ||
        otherInfoIsNotValid();
  }
}
