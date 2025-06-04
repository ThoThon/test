import '../../../base_app/base_app.src.dart';
import '../../login/model/model_src.dart';

class ProfileController extends BaseGetxController {
  AccountInfoModel? accountInfo;
  @override
  void onInit() {
    super.onInit();
    accountInfo = AppData.instance.accountInfoModel.value;
  }
}
