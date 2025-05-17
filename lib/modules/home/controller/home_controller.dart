import '../../../base_app/base_app.src.dart';
import '../../login/model/model_src.dart';
import '../../src.dart';

class HomeController extends BaseGetxController {
  final _appController = Get.find<AppController>();

  AccountInfoModel? accountInfo;

  @override
  void onInit() async {
    super.onInit();
    if (_appController.accountInfoModel != null) {
      accountInfo = _appController.accountInfoModel;
    }
  }
}
