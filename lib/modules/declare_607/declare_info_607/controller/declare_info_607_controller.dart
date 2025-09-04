import 'package:v_bhxh/base_app/controllers_base/base_controller/base_controller.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/declare/declaration_period/presentation/events/declaration_period_event.dart';
import 'package:v_bhxh/modules/declare/declare_info/repository/declare_info_repository.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/family_member.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/staff_list_argument.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/model_src.dart';
import 'package:v_bhxh/clean/shared/entity/province.dart';
import 'package:v_bhxh/clean/shared/entity/ward.dart';
import 'package:v_bhxh/modules/select_staff/model/select_staff_response.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

class DeclareInfo607Controller extends BaseGetxController {
  final DeclareInfoArgument argument = Get.arguments;
  final currentTab = DeclareInfo607Tab.tk1.obs;

  late final declareInfoRepository = DeclareInfoRepository(this);

  final tk1State = Tk1State607();
  final d01State = D01State();

  final autovalidateMode = Rx<AutovalidateMode?>(null);

  final enableClearTTIcon = false.obs;

  @override
  void onReady() {
    super.onReady();
    _getTk1Detail();
  }

  Future<void> _getTk1Detail() async {
    final staffId = argument.staffId;

    if (staffId == null) {
      return;
    }

    try {
      showLoadingOverlay();
      final response = await declareInfoRepository.getTk1Detail(id: staffId);
      final infoDetail = response.result;
      if (response.isSuccess && infoDetail != null) {
        tk1State.mapFromTk1Detail(infoDetail);
        d01State.mapFromTk1Detail(infoDetail);
        updateHouseholdInfoRequired();
        updateClearTTIconState();
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  Future<void> goToSelectStaffPage() async {
    KeyBoard.hide();
    final result = await Get.toNamed(
      AppRoutesCl.selectStaff.path,
      // Truyền id sang để biết nhân viên nào đang được chọn
      arguments: tk1State.selectedStaffId,
    );
    if (result is SelectStaffResponse) {
      await _getDetailStaff(staffId: result.id);

      // Kiểm tra xem có required thông tin chủ hộ hay không sau khi chọn nhân viên
      updateHouseholdInfoRequired();
      updateClearTTIconState();
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

  void onTabChanged(DeclareInfo607Tab tab) {
    KeyBoard.hide();
    currentTab.value = tab;
  }

  bool get enableD01Tab {
    return tk1State.isGenerateD01Data.value == true;
  }

  /// Kiểm tra xem có hiển thị nút Tiếp theo hay không
  ///
  /// Chỉ hiển thị nút tiếp theo nếu đang không phải tab cuối cùng được hiển thị
  bool get isShowNextButton {
    var lastTab = DeclareInfo607Tab.tk1;

    if (tk1State.isGenerateD01Data.value) {
      lastTab = DeclareInfo607Tab.d01;
    }

    return lastTab != currentTab.value;
  }

  Future<void> createNewDeclarationForm() async {
    final result = await Get.toNamed(
      AppRoutesCl.declarationFormDetail.path,
      arguments: DeclarationFormDetailArgument(
        bhxhCode: tk1State.bhxhTextCtrl.text,
        fullName: tk1State.fullNameTextCtrl.text,
      ),
    );
    if (result is DeclarationForm) {
      d01State.forms.add(result);
      showSnackBarCustom(
        LocaleKeys.declareInfo_addTableSuccess.tr,
        align: const Alignment(0, 0.6),
      );
    }
  }

  Future<void> editDeclarationForm(DeclarationForm form) async {
    final result = await Get.toNamed(
      AppRoutesCl.declarationFormDetail.path,
      arguments: DeclarationFormDetailArgument(form: form),
    );
    if (result is DeclarationForm) {
      final index =
          d01State.forms.indexWhere((element) => element.id == form.id);
      if (index != -1) {
        d01State.forms[index] = result;
        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
      }
    }
  }

  void showDialogDeleteForm(DeclarationForm form) {
    ShowDialog.showDialogConfirm2(
      backgroundColorBack: AppColors.basicWhite,
      textStyleBack:
          AppTextStyle.font14Re.copyWith(color: AppColors.primaryColor),
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
      if (currentTab.value == DeclareInfo607Tab.tk1) {
        if (tk1State.isGenerateD01Data.value) {
          currentTab.value = DeclareInfo607Tab.d01;
        }
      }
    }
  }

  /// Validate forms and return the first invalid tab
  DeclareInfo607Tab? get _invalidTab {
    if (tk1State.formKey.currentState?.validate() != true) {
      tk1State.autoValidateMode.value = AutovalidateMode.always;
      // Scroll to the first invalid field
      tk1State.registeredKey.currentState?.firstInvalid?.scrollToIntoView();
      return DeclareInfo607Tab.tk1;
    }

    return null;
  }

  Future<void> saveDraft() async {
    final invalidTab = _invalidTab;
    if (invalidTab != null) {
      currentTab.value = invalidTab;
      return;
    }

    if (tk1State.isGenerateD01Data.value && d01State.forms.isEmpty) {
      showSnackBar("Tờ khai không có dữ liệu kê khai");
      return;
    }

    if (argument.isUpdateStaff) {
      await _updateTk1();
    } else {
      await _addTk1();
    }
  }

  Future<void> _addTk1() async {
    try {
      showLoadingOverlay();
      final request = AddTk1Request607.fromState(
        kyKeKhaiId: argument.declarationPeriodId,
        tk1State: tk1State,
        d01State: d01State,
      );

      final response = await declareInfoRepository.addTk1(request: request);

      if (response.isSuccess) {
        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        if (argument.isAddPeriodFromDeclarePeriod) {
          // Đóng màn kê khai này và mở màn danh sách nhân viên
          // .then để bắt sự kiện đóng màn danh sách nhân viên này để refresh màn đợt kê khai
          Get.offNamed(
            AppRoutesCl.staffList.path,
            arguments: StaffListArgument(
              declarationPeriodId: argument.declarationPeriodId,
              procedureType: argument.procedureType,
            ),
          )?.then((value) {
            eventBus.fire(const RefreshDeclarationPeriodEvent());
          });
        } else if (argument.isAddStaffFromStaffList) {
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

  Future<void> _updateTk1() async {
    try {
      // Cập nhật cần có id của tờ khai, nhưng nếu get detail lỗi thì id sẽ là null
      // => Chặn việc cập nhật
      if (tk1State.id == null) {
        showSnackBar("Có lỗi xảy ra, không thể cập nhật thông tin");
        return;
      }

      showLoadingOverlay();
      final request = UpdateTk1Request.fromState(
        kyKeKhaiId: argument.declarationPeriodId,
        tk1State: tk1State,
        d01State: d01State,
      );

      final response = await declareInfoRepository.updateTk1(request: request);

      if (response.isSuccess) {
        showSnackBar(
          LocaleKeys.declareInfo_saveDataSuccess.tr,
          typeAction: AppConst.actionSuccess,
        );
        Get.back(
          result: argument.declarationPeriodId,
        );
      } else {
        showSnackBar(response.errorMessage);
      }
    } catch (e) {
      logger.e(e);
    } finally {
      hideLoadingOverlay();
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
    _syncPaperReceiveLocation();
  }

  void _syncPaperReceiveLocation() {
    if (tk1State.receiveResult.value == ReceiveProfileResultEnum.paper) {
      tk1State.provinceReceivePaper.value = tk1State.provinceReceive.value;
      tk1State.wardReceivePaper.value = tk1State.wardReceive.value;
      tk1State.addressReceivePaperTextCtrl.text =
          tk1State.addressReceiveTextCtrl.text;
    }
  }

  void _clearReceiveAddress() {
    tk1State.provinceReceive.value = null;
    tk1State.wardReceive.value = null;
    tk1State.addressReceiveTextCtrl.clear();
  }

  /// Đồng bộ địa chỉ nơi nhận hồ sơ với địa chỉ khai sinh
  void _syncBirthAddress() {
    if (tk1State.isDuplicateBirthAddress.value) {
      tk1State.provinceReceive.value = tk1State.provinceOfBirth.value;
      tk1State.wardReceive.value = tk1State.wardOfBirth.value;
      tk1State.addressReceiveTextCtrl.text = tk1State.birthAddressTextCtrl.text;
    } else {
      _clearReceiveAddress();
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

  void changeProvinceOfBirth(Province value) {
    if (tk1State.provinceOfBirth.value != value) {
      // Xóa xã khai sinh khi thay đổi tỉnh khai sinh
      tk1State.wardOfBirth.value = null;
    }

    tk1State.provinceOfBirth.value = value;

    // Đồng bộ tỉnh nơi nhận hồ sơ với tỉnh khai sinh
    if (tk1State.isDuplicateBirthAddress.value) {
      if (tk1State.provinceReceive.value != value) {
        // Xóa xã nơi nhận hồ sơ khi thay đổi tỉnh nơi nhận hồ sơ
        tk1State.wardReceive.value = null;
      }

      tk1State.provinceReceive.value = value;
      _syncDataAddressInfoAndProfileInfo();
    }

    if (tk1State.isParticipantHeadOfHousehold.value) {
      if (tk1State.provinceTT.value != value) {
        // Xóa xã thường trú khi thay đổi tỉnh thường trú
        tk1State.wardTT.value = null;
      }

      tk1State.provinceTT.value = value;
    }
  }

  void changeWardOfBirth(Ward value) {
    tk1State.wardOfBirth.value = value;

    // Đồng bộ xã nơi nhận hồ sơ với xã khai sinh
    if (tk1State.isDuplicateBirthAddress.value) {
      tk1State.wardReceive.value = value;
      _syncDataAddressInfoAndProfileInfo();
    }

    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.wardTT.value = value;
    }
  }

  void onChangeBirthAddress(String value) {
    // Đồng bộ địa chỉ nơi nhận hồ sơ với địa chỉ khai sinh
    if (tk1State.isDuplicateBirthAddress.value) {
      tk1State.addressReceiveTextCtrl.text = value;
      if (tk1State.receiveResult.value == ReceiveProfileResultEnum.paper) {
        tk1State.addressReceivePaperTextCtrl.text =
            tk1State.addressReceiveTextCtrl.text;
      }
    }

    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.addressTTTextCtrl.text = value;
    }
  }

  /// Đồng bộ tỉnh/huyện/xã nơi nhận hồ sơ giấy với tỉnh/huyện/xã nơi nhận
  void _syncDataAddressInfoAndProfileInfo() {
    if (tk1State.receiveResult.value == ReceiveProfileResultEnum.paper) {
      tk1State.provinceReceivePaper.value = tk1State.provinceReceive.value;
      tk1State.wardReceivePaper.value = tk1State.wardReceive.value;
    }
  }

  void onChangeProvinceReceive(Province value) {
    if (tk1State.provinceReceive.value != value) {
      // Khi user thay đổi tỉnh nơi nhận hồ sơ tự động uncheck checkbox trùng địa chỉ
      tk1State.isDuplicateBirthAddress.value = false;

      // Xóa xã nơi nhận hồ sơ khi thay đổi tỉnh nơi nhận hồ sơ
      tk1State.wardReceive.value = null;
    }

    tk1State.provinceReceive.value = value;

    _syncDataAddressInfoAndProfileInfo();

    if (tk1State.isParticipantHeadOfHousehold.value) {
      if (tk1State.provinceTT.value != value) {
        // Xóa xã thường trú khi thay đổi tỉnh thường trú
        tk1State.wardTT.value = null;
      }

      tk1State.provinceTT.value = value;
    }
  }

  void onChangeWardReceive(Ward value) {
    if (tk1State.wardReceive.value != value) {
      // Khi user thay đổi xã nơi nhận hồ sơ tự động uncheck checkbox trùng địa chỉ
      tk1State.isDuplicateBirthAddress.value = false;
    }
    tk1State.wardReceive.value = value;

    _syncDataAddressInfoAndProfileInfo();

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
    if (tk1State.receiveResult.value == ReceiveProfileResultEnum.paper) {
      tk1State.addressReceivePaperTextCtrl.text =
          tk1State.addressReceiveTextCtrl.text;
    }
  }

  void onChangeParticipantHeadOfHousehold(bool value) {
    tk1State.isParticipantHeadOfHousehold.value = value;
    _syncHeadOfHouseholdInfo();
    updateHouseholdInfoRequired();
  }

  void onChangeProvinceKCB(Province value) {
    if (tk1State.provinceKCB.value != value) {
      // Xóa bệnh viện nơi KCB khi thay đổi tỉnh nơi KCB
      tk1State.hospitalKCB.value = null;
    }

    tk1State.provinceKCB.value = value;
  }

  /// Đồng bộ thông tin của người đại diện với thông tin của người tham gia
  void _syncHeadOfHouseholdInfo() {
    if (tk1State.isParticipantHeadOfHousehold.value) {
      tk1State.headOfHouseholdTextCtrl.text = tk1State.fullNameTextCtrl.text;
      tk1State.headOfHouseholdCCCDTextCtrl.text = tk1State.cccdTextCtrl.text;
      tk1State.provinceTT.value = tk1State.provinceReceive.value;
      tk1State.wardTT.value = tk1State.wardReceive.value;
      tk1State.addressTTTextCtrl.text = tk1State.addressReceiveTextCtrl.text;
    } else {
      tk1State.headOfHouseholdTextCtrl.clear();
      tk1State.headOfHouseholdCCCDTextCtrl.clear();
      tk1State.provinceTT.value = null;
      tk1State.wardTT.value = null;
      tk1State.addressTTTextCtrl.clear();
    }
  }

  void onChangeHeadOfHouseholdFullName(String value) {
    tk1State.isParticipantHeadOfHousehold.value = false;
    // tk1State.headOfHouseholdTextCtrl.text = value;
    updateHouseholdInfoRequired();
  }

  void onChangeHeadOfHouseholdCCCD(String value) {
    tk1State.isParticipantHeadOfHousehold.value = false;
    // tk1State.headOfHouseholdCCCDTextCtrl.text = value;
    updateHouseholdInfoRequired();
  }

  void onChangeProvinceTT(Province value) {
    if (tk1State.provinceTT.value != value) {
      tk1State.isParticipantHeadOfHousehold.value = false;
      // Xóa xã thường trú khi thay đổi tỉnh thường trú
      tk1State.wardTT.value = null;
    }

    tk1State.provinceTT.value = value;
    updateHouseholdInfoRequired();
  }

  void onChangeWardTT(Ward value) {
    if (tk1State.wardTT.value != value) {
      tk1State.isParticipantHeadOfHousehold.value = false;
    }

    tk1State.wardTT.value = value;
    updateHouseholdInfoRequired();
  }

  void onChangeAddressTT(String value) {
    tk1State.isParticipantHeadOfHousehold.value = false;
    updateHouseholdInfoRequired();
  }

  Future<void> addFamilyMember() async {
    KeyBoard.hide();
    final result = await Get.toNamed(AppRoutesCl.familyMemberDetail.path);
    if (result is FamilyMember) {
      tk1State.familyMembers.add(result);
    }
    updateHouseholdInfoRequired();
  }

  Future<void> editFamilyMember(FamilyMember member) async {
    final result = await Get.toNamed(
      AppRoutesCl.familyMemberDetail.path,
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
        final response =
            await declareInfoRepository.deleteMember607(id: memberId);
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
    updateHouseholdInfoRequired();
  }

  void onTapClearProvinceTT() {
    tk1State.provinceTT.value = null;
    tk1State.wardTT.value = null;
    updateHouseholdInfoRequired();
  }

  void onTapClearWardTT() {
    tk1State.wardTT.value = null;
    updateHouseholdInfoRequired();
  }

  void onChangeProvinceReceivePaper(Province value) {
    if (tk1State.provinceReceivePaper.value != value) {
      tk1State.wardReceivePaper.value = null;
    }

    tk1State.provinceReceivePaper.value = value;
  }

  void onChangeWardReceivePaper(Ward value) {
    tk1State.wardReceivePaper.value = value;
  }

  void onTapClearProvinceReceivePaper() {
    tk1State.provinceReceivePaper.value = null;
    tk1State.wardReceivePaper.value = null;
  }

  void onTapClearWardReceivePaper() {
    tk1State.wardReceivePaper.value = null;
  }

  void onChangeReceiveResult(ReceiveProfileResultEnum value) {
    tk1State.receiveResult.value = value;

    // Khi chọn nhận kết quả giấy thì địa chỉ nhận kết quả sẽ là địa chỉ nhận hồ sơ
    if (value == ReceiveProfileResultEnum.paper) {
      tk1State.provinceReceivePaper.value = tk1State.provinceReceive.value;
      tk1State.wardReceivePaper.value = tk1State.wardReceive.value;
      tk1State.addressReceivePaperTextCtrl.text =
          tk1State.addressReceiveTextCtrl.text;
    } else if (value == ReceiveProfileResultEnum.electronic) {
      tk1State.provinceReceivePaper.value = null;
      tk1State.wardReceivePaper.value = null;
      tk1State.addressReceivePaperTextCtrl.text = '';
    }
  }

  bool get isHouseholdInfoEmpty {
    return tk1State.headOfHouseholdTextCtrl.text.trim().isEmpty &&
        tk1State.headOfHouseholdCCCDTextCtrl.text.trim().isEmpty &&
        tk1State.provinceTT.value == null &&
        tk1State.wardTT.value == null &&
        tk1State.addressTTTextCtrl.text.trim().isEmpty;
  }

  /// Cập nhật thông tin chủ hộ là required hay không
  void updateHouseholdInfoRequired() {
    // Nếu "Mã số BHXH" empty thì Thông tin chủ hộ sẽ là required
    if (tk1State.bhxhTextCtrl.text.trim().isEmpty) {
      tk1State.isHouseholdInfoRequired.value = true;
      return;
    }

    // Nếu 1 trong các thông tin của chủ hộ được điền thì sẽ phải điền tất cả
    if (!isHouseholdInfoEmpty) {
      tk1State.isHouseholdInfoRequired.value = true;
      return;
    }

    // REF: TH2 VBHXHMOB-16
    if (tk1State.familyMembers.isNotEmpty) {
      tk1State.isHouseholdInfoRequired.value = true;
      return;
    }

    // Nếu không có điều kiện nào thỏa mãn
    tk1State.isHouseholdInfoRequired.value = false;
  }

  void updateClearTTIconState() {
    final bhxhText = tk1State.bhxhTextCtrl.text.trim();
    enableClearTTIcon.value = bhxhText.isNotEmpty;
  }

  @override
  void onClose() {
    tk1State.dispose();
    super.onClose();
  }
}
