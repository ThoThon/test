import 'package:v_bhxh/modules/declare/declare_info/model/d02/add_d02_request.dart';
import 'package:v_bhxh/modules/declare/declare_info/repository/declare_info_repository.dart';
import 'package:v_bhxh/modules/declare/deposit_info/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../../base_app/base_app.src.dart';

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

  bool get isShowScanIDButton {
    return currentTab.value == DeclareInfoTab.d02 ||
        currentTab.value == DeclareInfoTab.tk1;
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

  void showDialogSelectStaff() {
    Get.bottomSheet(
      BottomSheetSearch<String>(
        title: 'Chọn nhân viên',
        listFilter: ['Phạm Văn Cường', 'Hoàng Xuân Hiệp', 'Bắc'],
        selectedItem: selectedStaff.value,
        display: (value) => value,
        onAccept: (value) {
          if (value == null) return;
          selectedStaff.value = value;
        },
      ),
      isScrollControlled: true,
    );
  }

  void createNewDeclarationForm() {
    Get.toNamed(
      AppRoutes.declarationFormDetail.path,
      arguments: DeclarationFormDetailArgument(
        action: DeclarationFormDetailAction.create,
        fullName: d02Tk1State.fullNameTextCtrl.text.trim(),
        bhxhCode: d02Tk1State.bhxhTextCtrl.text.trim(),
      ),
    );
  }

  void showDialogDeleteForm(DeclarationForm form) {
    ShowDialog.showDialogConfirm2(
      title: 'Xóa "${form.title}"?',
      confirmTitle: 'Xóa',
      onConfirm: () {
        //
      },
    );
  }

  void nextTab() {
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

    final invalidTab = _invalidTab;
    if (invalidTab != null) {
      currentTab.value = invalidTab;
      return;
    }

    ShowDialog.showDialogWithWidget(
      title: 'Hoàn tất',
      content: 'Bạn muốn Chuyển ký hay thêm tiếp nhân sự?',
      child: CompleteDeclareInfoWidget(
        onTapAddStaff: () {
          currentTab.value = DeclareInfoTab.d02;
        },
        onTapDeposit: () async {
          final result = await Get.toNamed(AppRoutes.depositInfo.path);

          if (result is DepositInfoResult) {
            if (result.action == DepositInfoResultAction.selectD02Tab) {
              currentTab.value = DeclareInfoTab.d02;
            }
          }
        },
      ),
    );
  }

  /// Validate forms and return the first invalid tab
  DeclareInfoTab? get _invalidTab {
    if (d02State.formKey.currentState?.validate() != true) {
      return DeclareInfoTab.d02;
    }

    if (d02State.isGenerateTk1Data.value &&
        tk1State.formKey.currentState?.validate() != true) {
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

        Get.toNamed(
          AppRoutes.depositInfo.path,
          arguments: argument.declarationPeriodId,
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

  @override
  void onClose() {
    d02Tk1State.dispose();
    d02State.dispose();
    tk1State.dispose();
    super.onClose();
  }
}
