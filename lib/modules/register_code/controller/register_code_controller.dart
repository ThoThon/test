import 'package:flutter/cupertino.dart';
import 'package:path/path.dart';
import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/shares/package/export_package.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../../shares/widgets/keyboard/keyboard.dart';
import '../../login/model/model_src.dart';
import '../../src.dart';

// Nếu mã lỗi là 58061 thì có thể retry ký số (from a Chương)
const _allowRetryCode = "58061";

class RegisterCodeController extends BaseGetxController {
  final currentTab = RegisterCodeTabEnum.common_info.obs;

  // Mã số thuế
  final taxCodeCtrl = TextEditingController();

  // Tên đơn vị
  final unitNameCtrl = TextEditingController();

  // Loại đối tượng
  final selectedObject = Rxn<ObjectTypeModel>();

  // Loại hình đơn vị
  final unitTypeCtrl = TextEditingController();

  // Ngành nghề sản xuất
  final productIndustryCtrl = TextEditingController();

  // Số quyết định
  final decisionNumberCtrl = TextEditingController();

  // Ngày lập
  final setupDateCtrl = TextEditingController();

  // Ngày đăng ký
  final registerDateCtrl = TextEditingController();

  // Nơi cấp quyết định
  final addressDecisionCtrl = TextEditingController();

  // Địa chỉ đăng ký kinh doanh
  final addressRegisterBusinessCtrl = TextEditingController();

  // Địa chỉ đơn vị
  final addressUnitCtrl = TextEditingController();

  // Điện thoại đơn vị
  final phoneUnitCtrl = TextEditingController();

  // Email đơn vị
  final emailUnitCtrl = TextEditingController();

  // Người giao dịch BHXH
  final personTransactionBhxhCtrl = TextEditingController();

  // Điện thoại liên hệ
  final phoneContactCtrl = TextEditingController();

  // Cơ quan BHXH
  final socialAgency = Rxn<SocialAgencyModel>();

  // Nơi nhận tỉnh
  final provinceReceive = Rxn<ProvinceModel>();

  // Nơi nhận huyện
  final districtReceive = Rxn<DistrictModel>();

  // Nơi nhận xã
  final wardReceive = Rxn<WardModel>();

  // Đăng ký nhận kết quả
  final registerResult = Rxn<RegisterReceiveResultModel>();

  // Phương thức nhận kết quả
  final resultReceiveMethod = Rxn<ReceiveMethodModel>();

  // Phương thức đóng
  final paymentMethod = Rxn<PaymentMethodModel>();

  // Tên đăng nhập MySign
  final usernameMySignCtrl = TextEditingController();

  // Hồ sơ kèm theo
  final fileIncludeCtrl = TextEditingController();

  // Nội dung
  final contentCtrl = TextEditingController();

  late final _registerCodeRepository = RegisterCodeRepository(this);

  final certificate = Rxn<CertificateModel>();

  final listCert = <CertificateModel>[].obs;

  final imagePath = Rxn<String>();

  final listImage = <String>[].obs;

  final formKeyCommonTab = GlobalKey<FormState>();

  final formKeyRegisterTab = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    getRegisterFirstCategories();
  }

  void onTabChanged(RegisterCodeTabEnum tab) {
    KeyBoard.hide();
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }

  Future<void> getRegisterFirstCategories() async {
    try {
      showLoadingOverlay();
      final response =
          await _registerCodeRepository.getRegisterFirstCategories();
      final registerCategories = response.result;
      if (registerCategories != null && response.isSuccess) {
        AppData.instance
          ..provinces = registerCategories.provinces
          ..socialAgency = registerCategories.agencies
          ..receiveMethod = registerCategories.receiveMethods
          ..paymentMethods = registerCategories.paymentMethods
          ..resultReceivingOptions = registerCategories.resultReceivingOptions
          ..objectType = registerCategories.objectType;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  void changeProvinceReceive(ProvinceModel value) {
    if (provinceReceive.value != value) {
      districtReceive.value = null;
      wardReceive.value = null;
    }
    provinceReceive.value = value;
  }

  void changeDistrictReceive(DistrictModel value) {
    if (districtReceive.value != value) {
      wardReceive.value = null;
    }
    districtReceive.value = value;
  }

  void changeWardReceive(WardModel value) {
    wardReceive.value = value;
  }

  Future<void> fetchListCert() async {
    try {
      showLoadingOverlay();
      listCert.clear();
      final response =
          await _registerCodeRepository.getListCert(usernameMySignCtrl.text);
      if (response.isSuccess) {
        listCert.value = response.result;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> getListCertificate() async {
    await fetchListCert();
    if (listCert.isNotEmpty) {
      final result = await Get.bottomSheet(
        SelectCertificateBts(
          listCert: listCert,
        ),
      );
      if (result != null) {
        certificate.value = result;
      }
    } else {
      showSnackBar(LocaleKeys.registerService_usernameMySignNotFound.tr);
    }
  }

  Future<void> pickImage() async {
    final path = await ImageUtils.pickImage();
    if (path != null) {
      listImage.add(path);
    }
  }

  Future<void> takePhoto() async {
    final path = await ImageUtils.takePhoto();
    if (path != null) {
      listImage.add(path);
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void deleteImage(int index) {
    listImage.removeAt(index);
  }

  FirstRegisterRequest _buildRequest() {
    return FirstRegisterRequest(
      coQuanBHXHQuanLy: socialAgency.value?.maCoQuanBHXH ?? '',
      coQuanBHXHTinh: '01',
      credentialID: certificate.value?.cerdentialID ?? '',
      diaChi: addressUnitCtrl.text,
      diaChiHuyen: districtReceive.value?.id ?? '',
      diaChiTinh: provinceReceive.value?.id ?? '',
      diaChiXa: wardReceive.value?.id ?? '',
      diaChiDangKyKinhDoanh: addressRegisterBusinessCtrl.text,
      dienThoai: phoneUnitCtrl.text,
      dienThoaiLienHe: phoneContactCtrl.text,
      email: emailUnitCtrl.text,
      hoSoKemTheo: fileIncludeCtrl.text,
      loaiDoiTuong: selectedObject.value?.value ?? '',
      loaiHinhDonVi: unitTypeCtrl.text,
      maSoThue: taxCodeCtrl.text,
      nganhNgheSX: productIndustryCtrl.text,
      ngayDangKy: registerDateCtrl.text,
      ngayLap: setupDateCtrl.text,
      nguoiGiaoDich: personTransactionBhxhCtrl.text,
      noiCapQuyetDinh: addressDecisionCtrl.text,
      noiDung: contentCtrl.text,
      phuongThucDong: paymentMethod.value?.value ?? '',
      phuongThucNhanKetQua: registerResult.value?.value ?? '',
      soQuyetDinh: decisionNumberCtrl.text,
      tenDonVi: unitNameCtrl.text,
      userId: usernameMySignCtrl.text,
      phuongThucNhan: resultReceiveMethod.value?.value ?? '',
      imageFilePath: listImage,
    );
  }

  RegisterCodeTabEnum? get _invalidTab {
    if (formKeyCommonTab.currentState?.validate() != true) {
      return RegisterCodeTabEnum.common_info;
    }

    if (formKeyRegisterTab.currentState?.validate() != true) {
      return RegisterCodeTabEnum.register_info;
    }

    return null;
  }

  Future<void> registerCodeFirst() async {
    final invalidTab = _invalidTab;

    if (invalidTab == null) {
      // Nếu tất cả các tab đều hợp lệ thì chuyển đến tab cuối cùng (tab thông tin đăng ký)
      currentTab.value = RegisterCodeTabEnum.register_info;
    } else {
      // Nếu có tab không hợp lệ thì chuyển đến tab đó
      currentTab.value = invalidTab;
      return;
    }

    try {
      if (certificate.value == null) {
        showSnackBar(
          'Chưa có thông tin chứng thư số',
          typeAction: AppConst.actionFail,
        );
        return;
      }

      _showDialogCheckedSuccess();

      final response =
          await _registerCodeRepository.registerCodeFirst(_buildRequest());

      if (response.isSuccess) {
        ShowDialog.dismissDialog();
        _showDialogVerifySuccess();
      } else {
        ShowDialog.dismissDialog();

        final canRetry = response.code == _allowRetryCode;
        _showDialogVerifyFailed(
          errorMessage: response.errorMessage,
          onRetry: canRetry ? registerCodeFirst : null,
        );
      }
    } catch (e) {
      ShowDialog.dismissDialog();
      if (e is DioException) {
        _showDialogVerifyFailed(
          errorMessage: LocaleKeys.dialog_cannotConnectMySign.tr,
          onRetry: registerCodeFirst,
        );
      }
    }
  }

  void _showDialogCheckedSuccess() {
    ShowDialog.showDialogWithWidget(
      // isActiveBack: false,
      title: LocaleKeys.dialog_successTransfer.tr,
      content: LocaleKeys.dialog_fileSendToSignature.tr,
      child: const CupertinoActivityIndicator(
        radius: 20,
      ).paddingOnly(top: AppDimens.defaultPadding),
    );
  }

  void _showDialogVerifySuccess() {
    ShowDialog.showDialogConfirm2(
      title:
          'Vui lòng kiểm tra email đã đăng ký (thời gian xử lý 3 - 5 ngày làm việc)',
      content: LocaleKeys.dialog_submitRegisterToSuccess.tr,
      iconType: DialogIconType.success,
      exitTitle: LocaleKeys.dialog_exit.tr,
      confirmTitle: LocaleKeys.dialog_history.tr,
      isDisableButtonConfirm: true,
      onCancel: () {
        // Get.offAllNamed(AppRoutes.login.path);
        // Get back vì màn trước của nó đang là màn login
        Get.back();
      },
    );
  }

  void _showDialogVerifyFailed({
    required String errorMessage,
    VoidCallback? onRetry,
  }) {
    ShowDialog.showDialogConfirm2(
      title: LocaleKeys.dialog_fail.tr,
      content: errorMessage,
      iconType: DialogIconType.failure,
      exitTitle: LocaleKeys.dialog_close.tr,
      showConfirmButton: onRetry != null,
      confirmTitle: onRetry != null ? LocaleKeys.dialog_resend.tr : null,
      onConfirm: onRetry,
    );
  }

  @override
  void onClose() {
    taxCodeCtrl.dispose();
    unitNameCtrl.dispose();
    unitTypeCtrl.dispose();
    productIndustryCtrl.dispose();
    decisionNumberCtrl.dispose();
    setupDateCtrl.dispose();
    registerDateCtrl.dispose();
    addressDecisionCtrl.dispose();
    addressRegisterBusinessCtrl.dispose();
    addressUnitCtrl.dispose();
    phoneUnitCtrl.dispose();
    emailUnitCtrl.dispose();
    personTransactionBhxhCtrl.dispose();
    phoneContactCtrl.dispose();
    usernameMySignCtrl.dispose();
    fileIncludeCtrl.dispose();
    contentCtrl.dispose();
    super.onClose();
  }
}
