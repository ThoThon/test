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

  @override
  void onClose() {
    d02State.dispose();
    tk1State.dispose();
    super.onClose();
  }
}
