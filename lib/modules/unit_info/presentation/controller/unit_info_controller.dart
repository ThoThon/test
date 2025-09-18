import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

import '../../../../base_app/model/app_data.dart';
import '../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../../shares/widgets/dialog/dialog_utils.dart';
import '../../../src.dart';

class UnitInfoController extends BaseGetClController {
  final GetTotalNotiUnreadUseCase _getTotalNotiUnreadUseCase;
  final GetUnitInfoUseCase _getUnitInfoUseCase;
  final UpdateUnitInfoUseCase _updateUnitInfoUseCase;

  UnitInfoController(
    this._getTotalNotiUnreadUseCase,
    this._getUnitInfoUseCase,
    this._updateUnitInfoUseCase,
  );

  // Mã số thuế
  final taxCodeController = TextEditingController();

  // Tên đơn vị
  final unitNameController = TextEditingController();

  // Mã đơn vị
  final unitCodeController = TextEditingController();

  // Tên cơ quan BHXH
  final socialAgencyNameCtrl = TextEditingController();

  // Mã cơ quan BHXH
  final socialAgencyCodeCtrl = TextEditingController();

  // Địa chỉ ĐKKD
  final addressRegisterController = TextEditingController();

  // Địa chỉ giao dịch hồ sơ
  final addressTransactionController = TextEditingController();

  /// Người đại diện - ten_nguoi_ky
  final nameRepresentController = TextEditingController();

  // Chức vụ
  final positionController = TextEditingController();

  /// Người giao dịch BHXH - ten_nguoi_ke_khai
  final personTransactionController = TextEditingController();

  // Điện thoại liên hệ
  final phoneContactController = TextEditingController();

  // Email liên hệ
  final emailContactController = TextEditingController();

  // Lương cơ sở
  final basicSalaryController = TextEditingController();

  // Phương thức đóng
  Rx<PaymentMethodEnum?> selectedMethod = Rx<PaymentMethodEnum?>(null);

  // Đăng ký nhận kết quả
  Rx<ReceiveResultEnum?> selectedReceive = Rx<ReceiveResultEnum?>(null);

  AccountInfo? accountInfo;

  final isEditAll = false.obs;

  UpdateUnitInfoRequest? originalInfo;

  final formKey = GlobalKey<FormState>();

  final isInputUnchanged = true.obs;

  @override
  void onInit() async {
    super.onInit();
    await _getAccountInfo();
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

  void mapAccountInfoToUI() {
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

  void checkInputChanged() {
    isInputUnchanged.value = originalInfo == _buildRequest();
  }

  void handleCancelEdit() {
    if (isInputUnchanged.value) {
      isEditAll.value = false;
    } else {
      nav.showInfoDialog(
        iconType: DialogIconType.note,
        title: LocaleKeys.dialog_cancelUpdate.tr,
        subtitle: LocaleKeys.dialog_cancelUpdateDialog.tr,
        cancelTitle: LocaleKeys.unitInfo_cancel.tr,
        confirmTitle: LocaleKeys.unitInfo_continue.tr,
        onCancel: () {
          mapAccountInfoToUI();
          isEditAll.value = false;

          // REF: VBHXHMOB-100
          isInputUnchanged.value = true;
        },
      );
    }
  }

  Future<void> updateAccountInfo() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        if (formKey.currentState?.validate() ?? false) {
          if (isInputUnchanged.value) return;
          await _updateUnitInfoUseCase.execute(_buildRequest());
          _getAccountInfo();
          _getToTalNotiUnread();
          isEditAll.value = false;

          nav.showInfoDialog(
            title: LocaleKeys.dialog_updateSuccess.tr,
            iconType: DialogIconType.success,
            showConfirmButton: true,
            subtitle: LocaleKeys.dialog_updateSuccessDialog.tr,
            confirmTitle: LocaleKeys.dialog_close.tr,
            showCancelButton: false,
          );
        }
      },
    );
  }

  UpdateUnitInfoRequest _buildRequest() {
    return UpdateUnitInfoRequest(
      organizationId: accountInfo?.toChucId ?? "",
      organizationName: unitNameController.text.trim(),
      registeredAddress: addressRegisterController.text.trim(),
      address: addressTransactionController.text.trim(),
      contactEmail: emailContactController.text.trim(),
      signerName: nameRepresentController.text.trim(),
      receiverPhone: phoneContactController.text.trim(),
      jobTitle: positionController.text.trim(),
      objectType: accountInfo?.loaiDoiTuong ?? "",
      declarerName: personTransactionController.text.trim(),
      salary: int.tryParse(basicSalaryController.text.replaceAll('.', '')) ?? 0,
      paymentMethod: selectedMethod.value?.month ?? 0,
      resultReceivingMethod: selectedReceive.value?.receive.tr ?? '',
    );
  }

  Future<void> _getAccountInfo() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final res = await _getUnitInfoUseCase.execute();
        AppData.instance.accountInfo.value = res;
        mapAccountInfoToUI();
      },
    );
  }

  Future<void> _getToTalNotiUnread() async {
    return buildState(
      action: () async {
        final res = await _getTotalNotiUnreadUseCase.execute();
        AppData.instance.totalUnread.value = res;
      },
    );
  }
}
