import '../../../base_app/base_app.src.dart';
import '../../login/model/model_src.dart';

class HomeController extends BaseGetxController {
  AccountInfoModel? accountInfo;

  @override
  void onInit() async {
    super.onInit();
    if (AppData.instance.accountInfoModel.value != null) {
      accountInfo = AppData.instance.accountInfoModel.value;
    }
  }
}
