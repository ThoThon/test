import '../../src.dart';

class HistoryDetailController extends BaseGetxController {
  late final HistoryItemModel historyItemModel;

  @override
  void onInit() async {
    super.onInit();
    getArg();
  }

  void getArg() {
    final arg = Get.arguments;
    if (arg is HistoryItemModel) {
      historyItemModel = arg;
    }
  }
}
