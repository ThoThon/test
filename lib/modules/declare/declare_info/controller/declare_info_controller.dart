import 'package:v_bhxh/modules/declare/check_list_detail/model/model_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/ui/ui_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../model/model_src.dart';

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
          onTapAddStaff: () {},
          onTapDeposit: () {
            Get.toNamed(AppRoutes.depositInfo.path);
          },
        ),
      );
    }
  }

  @override
  void onClose() {
    d02State.dispose();
    tk1State.dispose();
    super.onClose();
  }
}
