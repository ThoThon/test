import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../../modules/src.dart';

const _defaultPageIndex = 0;

class PageBuilderController extends BaseGetxController {
  final pageIndex = _defaultPageIndex.obs;

  final _appController = Get.find<AppController>();

  late final PageController pageController = PageController(
    initialPage: _defaultPageIndex,
  );

  @override
  void onInit() async {
    super.onInit();
    getAccountInfo();
  }

  Future<void> getAccountInfo() async {
    try {
      showLoadingOverlay();
      await _appController.getAccountInfo();
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoadingOverlay();
    }
  }

  void changePage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
