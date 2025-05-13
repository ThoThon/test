import 'package:v_bhxh/modules/src.dart';

import '../model/model_src.dart';

class DeclareInfoController extends BaseGetxController {
  final selectedTab = DeclareInfoTab.d02.obs;

  final d02State = D02State();
  final tk1State = Tk1State();

  void onTabChanged(DeclareInfoTab tab) {
    if (selectedTab.value == tab) return;
    selectedTab.value = tab;
  }

  void showDialogSelectStaff() {
    Get.bottomSheet(
      BottomSheetSearch<String>(
        title: 'Chọn nhân viên',
        listFilter: ['Phạm Văn Cường', 'Hoàng Xuân Hiệp', 'Bắc'],
        itemSelect: d02State.selectedStaff,
        display: (value) => value,
        onAccept: (value) {
          if (value == null) return;
          d02State.selectedStaff.value = value;
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
