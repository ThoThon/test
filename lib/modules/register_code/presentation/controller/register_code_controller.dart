import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:path/path.dart';
import 'package:v_bhxh/clean/core/presentation/controllers/base_get_cl_controller.dart';
import 'package:v_bhxh/clean/shared/constants/const.dart';
import 'package:v_bhxh/clean/shared/exceptions/remote/remote_exception.dart';
import 'package:v_bhxh/modules/register_code/domain/entity/tax_code_verify_request.dart';
import 'package:v_bhxh/modules/register_code/domain/usecase/tax_code_verify_use_case.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';

import '../../../../../clean/core/presentation/navigation/navigation_src.dart';
import '../../../../../clean/shared/entity/province.dart';
import '../../../../../clean/shared/entity/ward.dart';
import '../../../../../shares/widgets/keyboard/keyboard.dart';
import '../../../../clean/routes/app_routes_cl.dart';
import '../../../../clean/shared/entity/category.dart';
import '../../../src.dart';
import '../../domain/entity/certificate.dart';
import '../../domain/entity/first_time_register_request.dart';
import '../../domain/entity/register_code_categories.dart';
import '../../domain/entity/social_agency.dart';
import '../../domain/usecase/first_time_register_use_case.dart';
import '../../domain/usecase/get_categories_use_case.dart';
import '../../domain/usecase/get_certificate_use_case.dart';
import '../enum/register_code_tab_enum.dart';

/// Tỉnh mặc định là "Hà Nội"
const _defaultProvinceCode = '01';

// Chỉ cho phép up tối đa 7 file ảnh
const maxImageAttachments = 7;

class RegisterCodeController extends BaseGetClController {
  final GetCertificateUseCase _getCertificateUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final FirstTimeRegisterUseCase _firstTimeRegisterUseCase;
  final TaxCodeVerifyUseCase _taxCodeVerifyUseCase;

  RegisterCodeController(
    this._getCertificateUseCase,
    this._getCategoriesUseCase,
    this._firstTimeRegisterUseCase,
    this._taxCodeVerifyUseCase,
  );

  final currentTab = RegisterCodeTabEnum.common_info.obs;

  // Mã số thuế
  final taxCodeCtrl = TextEditingController();

  // Tên đơn vị
  final unitNameCtrl = TextEditingController();

  // Loại đối tượng
  final selectedObject = Rxn<Category>();

  // Loại hình đơn vị
  final unitTypeCtrl = TextEditingController();

  // Ngành nghề sản xuất
  final productIndustryCtrl = TextEditingController();

  // Số quyết định
  final decisionNumberCtrl = TextEditingController();

  // Ngày lập
  final setupDateCtrl = TextEditingController(
    text: convertDateToStringSafe(DateTime.now(), PATTERN_1),
  );

  // Ngày đăng ký
  final registerDateCtrl = TextEditingController(
    text: convertDateToStringSafe(DateTime.now(), PATTERN_1),
  );

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
  final socialAgency = Rxn<SocialAgency>();

  // Nơi nhận tỉnh
  final provinceReceive = Rxn<Province>();

  // Nơi nhận xã
  final wardReceive = Rxn<Ward>();

  // Đăng ký nhận kết quả
  final registerResult = Rxn<Category>();

  // Phương thức nhận kết quả
  final resultReceiveMethod = Rxn<Category>();

  // Phương thức đóng
  final paymentMethod = Rxn<Category>();

  // Tên đăng nhập MySign
  final usernameMySignCtrl = TextEditingController();

  // Hồ sơ kèm theo
  final fileIncludeCtrl = TextEditingController();

  // Nội dung
  final contentCtrl = TextEditingController();

  final certificate = Rxn<Certificate>();

  final listCert = <Certificate>[].obs;

  final imagePath = Rxn<String>();

  final listImage = <String>[].obs;

  final formKeyCommonTab = GlobalKey<FormState>();

  final registeredCommonTabKey = GlobalKey<FormRegistryWidgetState>();

  final formKeyRegisterTab = GlobalKey<FormState>();

  final registeredRegisterTabKey = GlobalKey<FormRegistryWidgetState>();

  final isEnableBtnSearchCert = false.obs;

  final registerCodeCategories = RegisterCodeCategories.empty().obs;

  @override
  void onInit() {
    super.onInit();
    getRegisterFirstCategories();
  }

  /// REF: VBHXHMOB-56
  bool checkMaxImageAttachments() {
    final reachedMax = listImage.length >= maxImageAttachments;
    if (reachedMax) {
      nav.showSnackBar(LocaleKeys.dialog_max7File.tr);
    }
    return reachedMax;
  }

  void onTabChanged(RegisterCodeTabEnum tab) {
    KeyBoard.hide();
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }

  void goToRegisterTab() {
    final invalidTab = _invalidTab;
    if (invalidTab == null) {
      // Nếu tất cả các tab đều hợp lệ thì chuyển đến tab cuối cùng (tab thông tin đăng ký)
      currentTab.value = RegisterCodeTabEnum.register_info;
    } else {
      // Nếu có tab không hợp lệ thì chuyển đến tab đó
      currentTab.value = invalidTab;
      return;
    }
  }

  Future<void> getRegisterFirstCategories() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response = await _getCategoriesUseCase.execute();
        registerCodeCategories.value = response;
      },
    );
  }

  void changeProvinceReceive(Province value) {
    if (provinceReceive.value != value) {
      wardReceive.value = null;
    }
    provinceReceive.value = value;
  }

  void changeWardReceive(Ward value) {
    wardReceive.value = value;
  }

  Future<void> fetchListCert() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        listCert.clear();
        final response =
            await _getCertificateUseCase.execute(usernameMySignCtrl.text);
        listCert.value = response;
      },
    );
  }

  Future<void> pickImage() async {
    try {
      final path = await ImageUtils.pickImage();
      if (path != null) {
        listImage.add(path);
      }
    } catch (e) {
      nav.showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
    }
  }

  Future<void> takePhoto() async {
    try {
      final path = await ImageUtils.takePhoto();
      if (path != null) {
        listImage.add(path);
      }
    } catch (e) {
      nav.showSnackBar(LocaleKeys.app_someThingWentWrong.tr);
    }
  }

  String getFileName(String path) {
    return basename(path);
  }

  void deleteImage(int index) {
    listImage.removeAt(index);
  }

  FirstTimeRegisterRequest _buildRequest() {
    return FirstTimeRegisterRequest(
      coQuanBHXHQuanLy: socialAgency.value?.maCoQuanBHXH ?? '',
      coQuanBHXHTinh: _defaultProvinceCode,
      credentialID: certificate.value?.cerdentialID ?? '',
      diaChi: addressUnitCtrl.text,
      diaChiHuyen: '', // Do do đã bỏ huyện
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
      // Auto scroll to first invalid field
      registeredCommonTabKey.currentState?.firstInvalid?.scrollToIntoView();
      return RegisterCodeTabEnum.common_info;
    }

    if (formKeyRegisterTab.currentState?.validate() != true) {
      // Auto scroll to first invalid field
      registeredRegisterTabKey.currentState?.firstInvalid?.scrollToIntoView();
      return RegisterCodeTabEnum.register_info;
    }

    return null;
  }

  Future<void> registerCodeFirst() async {
    return buildState(
      action: () async {
        final invalidTab = _invalidTab;
        if (invalidTab == null) {
          // Nếu tất cả các tab đều hợp lệ thì chuyển đến tab cuối cùng (tab thông tin đăng ký)
          currentTab.value = RegisterCodeTabEnum.register_info;
        } else {
          // Nếu có tab không hợp lệ thì chuyển đến tab đó
          currentTab.value = invalidTab;
          return;
        }
        if (certificate.value == null) {
          nav.showSnackBar(
            LocaleKeys.registerService_certificateInfoNotFound.tr,
            type: SnackBarType.failure,
          );
          return;
        }
        // Kiểm tra mst có hợp lệ hay không
        await _taxCodeVerifyUseCase.execute(
          TaxCodeVerifyRequest(
            taxCode: taxCodeCtrl.text,
            userId: certificate.value?.userId ?? '',
            credentialID: certificate.value?.cerdentialID ?? '',
          ),
        );
        _showDialogCheckedSuccess();
        await _firstTimeRegisterUseCase.execute(_buildRequest());
        nav.dismissDialog();
        _showDialogVerifySuccess();
      },
      onError: (error) {
        nav.dismissDialog();
        // REF: VBHXHMOB-44
        // REF: VBHXHMOB-50
        if (error is RemoteException) {
          if (error.kind == RemoteExceptionKind.serverDefined) {
            final serverMsg = error.serverError?.errorMessage;
            final serverCode = error.serverError?.code;
            if (serverCode == responseCodeShowDialog) {
              _showDialogVerifyFailed(errorMessage: serverMsg ?? '');
              return null;
            }
          }

          if (!isClosed && error.kind == RemoteExceptionKind.cancellation) {
            _showDialogVerifyFailed(
              errorMessage: LocaleKeys.dialog_cannotConnectMySign.tr,
            );
            return null;
          }
        }
        return error;
      },
    );
  }

  void _showDialogCheckedSuccess() {
    nav.showTimerDialog(
      title: LocaleKeys.dialog_sendRequestSignature.tr,
      subtitle: LocaleKeys.dialog_confirmSignatureMySign.tr,
      onFinish: () {
        _firstTimeRegisterUseCase.cancel();
      },
      onCancel: () {
        nav.until(ModalRoute.withName(AppRoutesCl.login.path));
      },
    );
  }

  void _showDialogVerifySuccess() {
    nav.showInfoDialog(
      iconType: DialogIconType.success,
      title: LocaleKeys.dialog_sendFileSuccess.tr,
      showCancelButton: false,
      confirmTitle: LocaleKeys.dialog_close.tr,
      subtitle: LocaleKeys.dialog_submitRegisterToSuccessMessage.tr,
      onConfirm: () {
        // Get back vì màn trước của nó đang là màn login
        nav.back();
      },
    );
  }

  void _showDialogVerifyFailed({
    required String errorMessage,
  }) {
    nav.showInfoDialog(
      title: LocaleKeys.dialog_sendFileFail.tr,
      confirmTitle: LocaleKeys.dialog_close.tr,
      subtitle: errorMessage,
      showCancelButton: false,
      iconType: DialogIconType.failure,
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

  void updateStateBtnSearchCert() {
    isEnableBtnSearchCert.value = usernameMySignCtrl.text.trim().isNotEmpty;
  }
}
