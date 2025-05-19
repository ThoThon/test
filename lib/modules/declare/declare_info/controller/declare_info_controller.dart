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

  void createNewCheckList() {
    Get.toNamed(
      AppRoutes.checkListDetail.path,
      arguments: CheckListDetailArgument(
        action: CheckListDetailAction.create,
      ),
    );
  }

  void showDialogDeleteCheckList(DocumentCheckList checkList) {
    ShowDialog.showDialogConfirm2(
      title: 'Xóa "${checkList.title}"?',
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
    if (d02State.formKey.currentState?.validate() == true) {
      //
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

  @override
  void onClose() {
    d02State.dispose();
    tk1State.dispose();
    super.onClose();
  }
}
