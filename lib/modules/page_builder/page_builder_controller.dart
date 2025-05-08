import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';

const _defaultPageIndex = 0;

class PageBuilderController extends BaseGetxController {
  final pageIndex = _defaultPageIndex.obs;

  late final PageController pageController = PageController(
    initialPage: _defaultPageIndex,
  );

  void changePage(int index) {
    pageIndex.value = index;
    pageController.jumpToPage(index);
  }
}
