import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../model/model_src.dart';

class DeclareInfoController extends BaseGetxController {
  final selectedTab = DeclareInfoTab.d02.obs;

  /// NOTE: Nhân viên được chọn - Mock tạm với String, sau tạo model riêng
  final selectedStaff = Rxn<String>();

  final d02Tk1State = D02Tk1State();
  final d02State = D02State();
  final tk1State = Tk1State();

  void onTabChanged(DeclareInfoTab tab) {
    KeyBoard.hide();
    if (selectedTab.value == tab) return;
    selectedTab.value = tab;
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

  @override
  void onClose() {
    d02State.dispose();
    tk1State.dispose();
    super.onClose();
  }
}
