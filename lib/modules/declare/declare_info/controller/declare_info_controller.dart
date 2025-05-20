import 'package:v_bhxh/modules/declare/deposit_info/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../../base_app/base_app.src.dart';

class DeclareInfoController extends BaseGetxController {
  final DeclareInfoArgument argument = Get.arguments;
  final currentTab = DeclareInfoTab.d02.obs;

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

  void showDialogSelectStaff() {
    Get.bottomSheet(
      BottomSheetSearch<String>(
        title: 'Chọn nhân viên',
        listFilter: ['Phạm Văn Cường', 'Hoàng Xuân Hiệp', 'Bắc'],
        itemSelect: selectedStaff,
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
      currentTab.value = DeclareInfoTab.tk1;
    } else if (currentTab.value == DeclareInfoTab.tk1) {
      currentTab.value = DeclareInfoTab.d01;
    } else if (currentTab.value == DeclareInfoTab.d01) {
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
  }

  void saveDraft() {
    if (d02State.formKey.currentState?.validate() != true) {
      currentTab.value = DeclareInfoTab.d02;
      return;
    }

    if (d02State.isGenerateTk1Data.value &&
        tk1State.formKey.currentState?.validate() != true) {
      currentTab.value = DeclareInfoTab.tk1;
      return;
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

    if (value) {
      // Khi chọn checkbox thì:
      // Tỉnh nơi nhận trùng với Tỉnh khai sinh, Huyện nơi nhận trùng với Huyện khai sinh, Xã nơi nhận trùng với Xã khai sinh, Địa chỉ nơi nhận trùng với địa chỉ khai sinh.
      // TH nếu đ/c khai sinh sửa lại thì đ/c nhận hồ sơ cũng thay đổi
      tk1State.provinceReceive.value = tk1State.provinceOfBirth.value;
      tk1State.districtReceive.value = tk1State.districtOfBirth.value;
      tk1State.wardReceive.value = tk1State.selectedWard.value;
      tk1State.addressReceiveTextCtrl.text = tk1State.birthAddressTextCtrl.text;
    }
  }

  @override
  void onClose() {
    d02State.dispose();
    tk1State.dispose();
    super.onClose();
  }
}
