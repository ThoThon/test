import 'package:v_bhxh/modules/declare/declare_info/model/d02/add_d02_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/model/d02/update_d02_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/repository/declare_info_repository.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../../base_app/base_app.src.dart';
import '../../../nfc/models/nfc_request_model.dart';
import '../../../select_staff/model/select_staff_response.dart';

class DeclareInfoController extends BaseGetxController {
  final DeclareInfoArgument argument = Get.arguments;
  final currentTab = DeclareInfoTab.d02.obs;

  late final declareInfoRepository = DeclareInfoRepository(this);

  /// NOTE: Nhân viên được chọn - Mock tạm với String, sau tạo model riêng
  final selectedStaff = Rxn<String>();

  final d02Tk1State = D02Tk1State();
  final d02State = D02State();
  final tk1State = Tk1State();
  final d01State = D01State();

  final autovalidateMode = Rx<AutovalidateMode?>(null);
  SendNfcRequestModel sendNfcRequestModel = SendNfcRequestModel();

  final declarationPeriodController =
      Get.findOrNull<DeclarationPeriodController>();

  @override
  void onReady() {
    super.onReady();
    _getD02Detail();
  }

  Future<void> _getD02Detail() async {
    final staffId = argument.staffId;

    if (staffId == null) {
      return;
    }

    try {
      showLoadingOverlay();
      final response = await declareInfoRepository.getD02Detail(id: staffId);
      final infoDetail = response.result;
      if (response.isSuccess && infoDetail != null) {
        // Update D02Tk1State
        d02Tk1State.mapFromD02Detail(infoDetail);
        d02State.mapFromD02Detail(infoDetail);
        tk1State.mapFromD02Detail(infoDetail);
        d01State.mapFromD02Detail(infoDetail);
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> _getDetailStaff({
    required String staffId,
  }) async {
    try {
      showLoadingOverlay();
      final response = await declareInfoRepository.getDetailStaff(id: staffId);
      final staff = response.result;
      if (response.isSuccess && staff != null) {
        d02Tk1State.mapFromStaffDetail(staff);
        d02State.mapFromStaffDetail(staff);
        tk1State.mapFromStaffDetail(staff);
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  void onTabChanged(DeclareInfoTab tab) {
    KeyBoard.hide();
    if (currentTab.value == tab) return;
    currentTab.value = tab;
  }

  bool get enableTk1Tab {
    return d02State.isGenerateTk1Data.value == true;
  }

  bool get enableD01Tab {
    return d02State.isGenerateD01Data.value == true;
  }

  // Chỉ cho phép quét cccd ở tab D02-LT
  bool get isShowScanIDButton {
    return currentTab.value == DeclareInfoTab.d02;
  }

  /// Kiểm tra xem có bắt buộc nhập mã BHXH hay không
  ///
  /// REF: http://10.100.140.19:8080/browse/BHW-2242
  bool get isBhxhCodeRequired {
    final declarationTypeId = d02State.declarationType.value?.value;

    // Tăng lương/Giảm lao động/Giảm lương
    if (declarationTypeId == 2 ||
        declarationTypeId == 3 ||
        declarationTypeId == 4) {
      return true;
    }

    if (declarationTypeId == 1) {
      return ['TD', 'TC', 'ON', 'AD', 'AT'].contains(d02State.plan.value?.id);
    }

    return false;
  }

  bool get isGenderRequired {
    return d02State.isGenerateD01Data.value || d02State.isGenerateTk1Data.value;
  }

  /// Kiểm tra xem có hiển thị nút Tiếp theo hay không
  ///
  /// Chỉ hiển thị nút tiếp theo nếu đang không phải tab cuối cùng được hiển thị
  bool get isShowNextButton {
    var lastTab = DeclareInfoTab.d02;

    if (d02State.isGenerateTk1Data.value) {
      lastTab = DeclareInfoTab.tk1;
    }

    if (d02State.isGenerateD01Data.value) {
      lastTab = DeclareInfoTab.d01;
    }

    return lastTab != currentTab.value;
  }

  void goToSelectStaffPage() async {
    final result = await Get.toNamed(AppRoutes.selectStaff.path);
    if (result is SelectStaffResponse) {
      _getDetailStaff(staffId: result.id);
    }
  }

  Future<void> createNewDeclarationForm() async {
    final result = await Get.toNamed(
      AppRoutes.declarationFormDetail.path,
      arguments: DeclarationFormDetailArgument(
        bhxhCode: d02Tk1State.bhxhTextCtrl.text,
        fullName: d02Tk1State.fullNameTextCtrl.text,
      ),
    );
    if (result is DeclarationForm) {
      d01State.forms.add(result);
    }
  }

  Future<void> editDeclarationForm(DeclarationForm form) async {
    final result = await Get.toNamed(
      AppRoutes.declarationFormDetail.path,
      arguments: DeclarationFormDetailArgument(form: form),
    );
    if (result is DeclarationForm) {
      final index =
          d01State.forms.indexWhere((element) => element.id == form.id);
      if (index != -1) {
        d01State.forms[index] = result;
      }
    }
  }

  void showDialogDeleteForm(DeclarationForm form) {
    ShowDialog.showDialogConfirm2(
      title: 'Xóa bảng kê?',
      confirmTitle: 'Xóa',
      onConfirm: () {
        deleteDeclarationForm(form);
      },
    );
  }

  /// Xóa bảng kê
  Future<void> deleteDeclarationForm(DeclarationForm form) async {
    final formId = form.id;
    if (formId == null) {
      showSnackBar('Có lỗi xảy ra, không thể xóa bảng kê');
      return;
    }

    if (form.isUpdate) {
      // Xóa ở DB
      try {
        showLoadingOverlay();
        final response = await declareInfoRepository.deleteForm(id: formId);
        if (response.isSuccess) {
          d01State.forms.removeWhere(
            (element) => element.id == formId,
          );
          showSnackBar(
            "Xóa bảng kê thành công",
            typeAction: AppConst.actionSuccess,
          );
        } else {
          showSnackBar(response.errorMessage);
        }
      } catch (e) {
        logger.e(e);
      } finally {
        hideLoadingOverlay();
      }
    } else {
      // Xóa ở local
      d01State.forms.removeWhere((element) => element.id == form.id);
      showSnackBar(
        "Xóa bảng kê thành công",
        typeAction: AppConst.actionSuccess,
      );
    }
  }

  void nextTab() {
    final invalidTab = _invalidTab;
    if (invalidTab != null) {
      currentTab.value = invalidTab;
    } else {
      if (currentTab.value == DeclareInfoTab.d02) {
        if (d02State.isGenerateTk1Data.value) {
          currentTab.value = DeclareInfoTab.tk1;
        } else if (d02State.isGenerateD01Data.value) {
          currentTab.value = DeclareInfoTab.d01;
        }
      } else if (currentTab.value == DeclareInfoTab.tk1) {
        if (d02State.isGenerateD01Data.value) {
          currentTab.value = DeclareInfoTab.d01;
        }
      }
    }
  }

  /// Validate forms and return the first invalid tab
  DeclareInfoTab? get _invalidTab {
    if (d02State.formKey.currentState?.validate() != true) {
      d02State.autoValidateMode.value = AutovalidateMode.always;
      return DeclareInfoTab.d02;
    }

    // REF: BHW-2240
    if (isGenderRequired && d02Tk1State.gender.value == null) {
      showSnackBar(LocaleKeys.declareInfo_genderCannotEmpty.tr);
      return DeclareInfoTab.d02;
    }

    if (d02State.isGenerateTk1Data.value &&
        tk1State.formKey.currentState?.validate() != true) {
      tk1State.autoValidateMode.value = AutovalidateMode.always;
      return DeclareInfoTab.tk1;
    }

    return null;
  }

  Future<void> saveDraft() async {
    final invalidTab = _invalidTab;
    if (invalidTab != null) {
      currentTab.value = invalidTab;
      return;
    }

    if (d02Tk1State.gender.value == null) {
      showSnackBar("Giới tính không được để trống");
      return;
    }

    if (d02State.isGenerateD01Data.value && d01State.forms.isEmpty) {
      showSnackBar("Tờ khai không có dữ liệu kê khai");
      return;
    }

    if (argument.isUpdate) {
      await _updateD02();
    } else {
      await _addD02();
    }
  }

  Future<void> _addD02() async {
    try {
      showLoadingOverlay();
      final request = AddD02Request.fromState(
        kyKeKhaiId: argument.declarationPeriodId,
        d02Tk1State: d02Tk1State,
        d02State: d02State,
        tk1State: tk1State,
        d01State: d01State,
      );

      final response = await declareInfoRepository.addD02(request: request);

      if (response.isSuccess) {
        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        if (argument.type == D02TypeEnum.addPeriod) {
          Get.offNamed(
            AppRoutes.staffList.path,
            arguments: argument.declarationPeriodId,
          )?.then((value) {
            declarationPeriodController?.getDeclarationPeriods();
          });
        } else if (argument.type == D02TypeEnum.addStaff) {
          Get.back(
            result: argument.declarationPeriodId,
          );
        }
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> _updateD02() async {
    try {
      showLoadingOverlay();
      final request = UpdateD02Request.fromState(
        kyKeKhaiId: argument.declarationPeriodId,
        d02Tk1State: d02Tk1State,
        d02State: d02State,
        tk1State: tk1State,
        d01State: d01State,
      );

      final response = await declareInfoRepository.updateD02(request: request);

      if (response.isSuccess) {
        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        if(argument.type == D02TypeEnum.updateStaff){
          Get.back(
            result: argument.declarationPeriodId,
          );
        }
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  void onChangeSalaryCoefficient({
    required bool value,
  }) {
    d02State.isSalaryCoefficient.value = value;

    if (value) {
      d02State.salaryAllowanceTextCtrl.clear();
      d02State.otherAllowanceTextCtrl.clear();
    } else {
      d02State.positionAllowanceTextCtrl.clear();
      d02State.pcTNNTextCtrl.clear();
      d02State.pcTNVuotKhungTextCtrl.clear();
    }
  }

  void onChangeDuplicateBirthAddress({
    required bool value,
  }) {
    tk1State.isDuplicateBirthAddress.value = value;

    // Khi chọn checkbox thì:
    // Tỉnh nơi nhận trùng với Tỉnh khai sinh, Huyện nơi nhận trùng với Huyện khai sinh, Xã nơi nhận trùng với Xã khai sinh, Địa chỉ nơi nhận trùng với địa chỉ khai sinh.
    // TH nếu đ/c khai sinh sửa lại thì đ/c nhận hồ sơ cũng thay đổi
    _syncBirthAddress();
    _syncHeadOfHouseholdInfo();
  }

  /// Đồng bộ địa chỉ nơi nhận hồ sơ với địa chỉ khai sinh
  void _syncBirthAddress() {
    if (tk1State.isDuplicateBirthAddress.value) {
      tk1State.provinceReceive.value = tk1State.provinceOfBirth.value;
      tk1State.districtReceive.value = tk1State.districtOfBirth.value;
      tk1State.wardReceive.value = tk1State.wardOfBirth.value;
      tk1State.addressReceiveTextCtrl.text = tk1State.birthAddressTextCtrl.text;
    }
  }

  void onChangeFullName(String value) {
    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.headOfHouseholdTextCtrl.text = value;
    }
  }

  void onChangeCCCD(String value) {
    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.headOfHouseholdCCCDTextCtrl.text = value;
    }
  }

  void changeProvinceOfBirth(ProvinceModel value) {
    if (tk1State.provinceOfBirth.value != value) {
      // Xóa huyện, xã, địa chỉ khai sinh khi thay đổi tỉnh khai sinh
      tk1State.districtOfBirth.value = null;
      tk1State.wardOfBirth.value = null;
    }

    tk1State.provinceOfBirth.value = value;

    // Đồng bộ tỉnh nơi nhận hồ sơ với tỉnh khai sinh
    if (tk1State.isDuplicateBirthAddress.value) {
      if (tk1State.provinceReceive.value != value) {
        // Xóa huyện, xã nơi nhận hồ sơ khi thay đổi tỉnh nơi nhận hồ sơ
        tk1State.districtReceive.value = null;
        tk1State.wardReceive.value = null;
      }

      tk1State.provinceReceive.value = value;
    }

    if (tk1State.isParticipantHeadOfHousehold.value) {
      if (tk1State.provinceTT.value != value) {
        // Xóa huyện, xã thường trú khi thay đổi tỉnh thường trú
        tk1State.districtTT.value = null;
        tk1State.wardTT.value = null;
      }

      tk1State.provinceTT.value = value;
    }
  }

  void changeDistrictOfBirth(DistrictModel value) {
    if (tk1State.districtOfBirth.value != value) {
      // Xóa xã khai sinh khi thay đổi huyện khai sinh
      tk1State.wardOfBirth.value = null;
    }

    tk1State.districtOfBirth.value = value;

    // Đồng bộ huyện nơi nhận hồ sơ với huyện khai sinh
    if (tk1State.isDuplicateBirthAddress.value) {
      if (tk1State.districtReceive.value != value) {
        // Xóa xã nơi nhận hồ sơ khi thay đổi huyện nơi nhận hồ sơ
        tk1State.wardReceive.value = null;
      }

      tk1State.districtReceive.value = value;
    }

    if (tk1State.isParticipantHeadOfHousehold.value) {
      if (tk1State.districtTT.value != value) {
        // Xóa xã thường trú khi thay đổi huyện thường trú
        tk1State.wardTT.value = null;
      }

      tk1State.districtTT.value = value;
    }
  }

  void changeWardOfBirth(WardModel value) {
    tk1State.wardOfBirth.value = value;

    // Đồng bộ xã nơi nhận hồ sơ với xã khai sinh
    if (tk1State.isDuplicateBirthAddress.value) {
      tk1State.wardReceive.value = value;
    }

    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.wardTT.value = value;
    }
  }

  void onChangeBirthAddress(String value) {
    // Đồng bộ địa chỉ nơi nhận hồ sơ với địa chỉ khai sinh
    if (tk1State.isDuplicateBirthAddress.value) {
      tk1State.addressReceiveTextCtrl.text = value;
    }

    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.addressTTTextCtrl.text = value;
    }
  }

  void onChangeProvinceReceive(ProvinceModel value) {
    if (tk1State.provinceReceive.value != value) {
      // Khi user thay đổi tỉnh nơi nhận hồ sơ tự động uncheck checkbox trùng địa chỉ
      tk1State.isDuplicateBirthAddress.value = false;

      // Xóa huyện, xã nơi nhận hồ sơ khi thay đổi tỉnh nơi nhận hồ sơ
      tk1State.districtReceive.value = null;
      tk1State.wardReceive.value = null;
    }

    tk1State.provinceReceive.value = value;

    if (tk1State.isParticipantHeadOfHousehold.value) {
      if (tk1State.provinceTT.value != value) {
        // Xóa huyện, xã thường trú khi thay đổi tỉnh thường trú
        tk1State.districtTT.value = null;
        tk1State.wardTT.value = null;
      }

      tk1State.provinceTT.value = value;
    }
  }

  void onChangeDistrictReceive(DistrictModel value) {
    if (tk1State.districtReceive.value != value) {
      // Khi user thay đổi huyện nơi nhận hồ sơ tự động uncheck checkbox trùng địa chỉ
      tk1State.isDuplicateBirthAddress.value = false;

      // Xóa xã nơi nhận hồ sơ khi thay đổi huyện nơi nhận hồ sơ
      tk1State.wardReceive.value = null;
    }
    tk1State.districtReceive.value = value;

    if (tk1State.isParticipantHeadOfHousehold.value) {
      if (tk1State.districtTT.value != value) {
        // Xóa xã thường trú khi thay đổi huyện thường trú
        tk1State.wardTT.value = null;
      }

      tk1State.districtTT.value = value;
    }
  }

  void onChangeWardReceive(WardModel value) {
    if (tk1State.wardReceive.value != value) {
      // Khi user thay đổi xã nơi nhận hồ sơ tự động uncheck checkbox trùng địa chỉ
      tk1State.isDuplicateBirthAddress.value = false;
    }
    tk1State.wardReceive.value = value;

    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.wardTT.value = value;
    }
  }

  void onChangeAddressReceive(String value) {
    // Khi user thay đổi địa chỉ nơi nhận hồ sơ tự động uncheck checkbox trùng địa chỉ
    tk1State.isDuplicateBirthAddress.value = false;

    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.addressTTTextCtrl.text = value;
    }
  }

  void onChangeParticipantHeadOfHousehold(bool value) {
    tk1State.isParticipantHeadOfHousehold.value = value;
    _syncHeadOfHouseholdInfo();
  }

  void onChangeProvinceKCB(ProvinceModel value) {
    if (tk1State.provinceKCB.value != value) {
      // Xóa bệnh viện nơi KCB khi thay đổi tỉnh nơi KCB
      tk1State.hospitalKCB.value = null;
    }

    tk1State.provinceKCB.value = value;
  }

  /// Đồng bộ thông tin của người đại diện với thông tin của người tham gia
  void _syncHeadOfHouseholdInfo() {
    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.headOfHouseholdTextCtrl.text = d02Tk1State.fullNameTextCtrl.text;
      tk1State.headOfHouseholdCCCDTextCtrl.text = d02Tk1State.cccdTextCtrl.text;
      tk1State.provinceTT.value = tk1State.provinceReceive.value;
      tk1State.districtTT.value = tk1State.districtReceive.value;
      tk1State.wardTT.value = tk1State.wardReceive.value;
      tk1State.addressTTTextCtrl.text = tk1State.addressReceiveTextCtrl.text;
    }
  }

  void onChangeHeadOfHouseholdFullName(String value) {
    tk1State.isParticipantHeadOfHousehold.value = false;
  }

  void onChangeHeadOfHouseholdCCCD(String value) {
    tk1State.isParticipantHeadOfHousehold.value = false;
  }

  void onChangeProvinceTT(ProvinceModel value) {
    if (tk1State.provinceTT.value != value) {
      tk1State.isParticipantHeadOfHousehold.value = false;
      // Xóa huyện, xã thường trú khi thay đổi tỉnh thường trú
      tk1State.districtTT.value = null;
      tk1State.wardTT.value = null;
    }

    tk1State.provinceTT.value = value;
  }

  void onChangeDistrictTT(DistrictModel value) {
    if (tk1State.districtTT.value != value) {
      tk1State.isParticipantHeadOfHousehold.value = false;
      // Xóa xã thường trú khi thay đổi huyện thường trú
      tk1State.wardTT.value = null;
    }

    tk1State.districtTT.value = value;
  }

  void onChangeWardTT(WardModel value) {
    if (tk1State.wardTT.value != value) {
      tk1State.isParticipantHeadOfHousehold.value = false;
    }

    tk1State.wardTT.value = value;
  }

  void onChangeAddressTT(String value) {
    tk1State.isParticipantHeadOfHousehold.value = false;
  }

  Future<void> addFamilyMember() async {
    final result = await Get.toNamed(AppRoutes.familyMemberDetail.path);
    if (result is FamilyMember) {
      tk1State.familyMembers.add(result);
    }
  }

  Future<void> editFamilyMember(FamilyMember member) async {
    final result = await Get.toNamed(
      AppRoutes.familyMemberDetail.path,
      arguments: member,
    );
    if (result is FamilyMember) {
      final index = tk1State.familyMembers
          .indexWhere((element) => element.id == member.id);
      if (index != -1) {
        tk1State.familyMembers[index] = result;
      }
    }
  }

  Future<void> deleteFamilyMember(FamilyMember member) async {
    final memberId = member.id;

    if (memberId == null) {
      showSnackBar('Có lỗi xảy ra, không thể xóa thành viên');
      return;
    }

    if (member.isUpdate) {
      // Xóa ở DB
      try {
        showLoadingOverlay();
        final response = await declareInfoRepository.deleteMember(id: memberId);
        if (response.isSuccess) {
          tk1State.familyMembers.removeWhere(
            (element) => element.id == memberId,
          );
          showSnackBar(
            "Xóa thành viên thành công",
            typeAction: AppConst.actionSuccess,
          );
        } else {
          showSnackBar(response.errorMessage);
        }
      } catch (e) {
        logger.e(e);
      } finally {
        hideLoadingOverlay();
      }
    } else {
      // Xóa ở local
      tk1State.familyMembers.removeWhere((element) => element.id == member.id);
      showSnackBar(
        "Xóa thành viên thành công",
        typeAction: AppConst.actionSuccess,
      );
    }
  }

  @override
  void onClose() {
    d02Tk1State.dispose();
    d02State.dispose();
    tk1State.dispose();
    super.onClose();
  }

  void goToScanCCCD() async {
    autovalidateMode.value = AutovalidateMode.always;

    final cccd = d02Tk1State.cccdTextCtrl.text.trim();
    if (!_isValidCCCD(cccd)) return;
    final result = await Get.toNamed(
      AppRoutes.nfc.path,
      arguments: cccd,
    );
    if (result != null) {
      sendNfcRequestModel = result;
      Gender? gender = sendNfcRequestModel.sexVMN?.parseGender;
      final query =
          sendNfcRequestModel.nationalityVMN?.trim().toUpperCase() ?? '';
      d02Tk1State
        ..fullNameTextCtrl.text = sendNfcRequestModel.nameVNM ?? ''
        ..cccdTextCtrl.text = sendNfcRequestModel.numberVMN ?? ''
        ..dateOfBirthTextCtrl.text = sendNfcRequestModel.dobVMN ?? ''
        ..gender.value = gender
        ..selectedEthnic.value = AppData.instance.ethnics
            .toList()
            .firstWhereOrNull(
                (ethnics) => ethnics.text == sendNfcRequestModel.nationVNM)
        ..selectedNationality.value =
            AppData.instance.nations.toList().firstWhereOrNull(
                  (nations) => nations.text.trim() == query,
                );
    }
  }

  bool _isValidCCCD(String cccd) {
    if (cccd.isEmpty) {
      showSnackBar(LocaleKeys.nfc_pleaseFillCccd.tr);
      return false;
    } else if (cccd.length < 12) {
      showSnackBar(LocaleKeys.declareInfo_cccdNumberIsValid.tr);
      return false;
    }
    return true;
  }
}
