import '../../../base_app/base_app.src.dart';
import '../../login/model/model_src.dart';
import '../../src.dart';

class HomeController extends BaseGetxController {
  // late final HomeRepository _homeRepository = HomeRepository(this);
  final appController = Get.find<AppController>();

  AccountInfoModel? accountInfo;
}
