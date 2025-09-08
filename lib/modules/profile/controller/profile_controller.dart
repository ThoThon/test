import 'package:v_bhxh/clean/shared/entity/entity_src.dart';

import '../../../base_app/base_app.src.dart';

class ProfileController extends BaseGetxController {
  AccountInfo? accountInfo;
  @override
  void onInit() {
    super.onInit();
    accountInfo = AppData.instance.accountInfo.value;
  }
}
