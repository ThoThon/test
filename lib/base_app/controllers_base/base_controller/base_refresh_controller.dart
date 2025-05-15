import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'base_controller.dart';

abstract class BaseRefreshGetxController extends BaseGetxController {
  final showBackToTopButton = false.obs;

  /// Controller của smart refresh.
  final refreshController = RefreshController();

  /// Hàm load more.
  Future<void> onLoadMore();

  /// Hàm refresh page.
  Future<void> onRefresh();
}
