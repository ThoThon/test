import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../../../core/values/const.dart';
import '../../notification_src.dart';

class NotificationController extends BaseGetClController {
  final GetListNotificationUseCase _listNotificationRequestUseCase;
  final DeleteListNotificationUseCase _deleteListNotificationUseCase;

  final listNotification = <NotificationItem>[].obs;

  final isShowCheckbox = false.obs;

  NotificationController(
    this._listNotificationRequestUseCase,
    this._deleteListNotificationUseCase,
  );

  // Dùng kiểu Set để tránh phần tử trùng nhau
  final selectedID = <String>{}.obs;

  int page = AppConst.defaultPageNumber;

  final refreshController = RefreshController();

  @override
  void onInit() {
    super.onInit();
    fetchListNotification();
  }

  Future<void> fetchListNotification({bool isLoadMore = false}) async {
    final request = _buildRequest(isLoadMore: isLoadMore);
    return buildState(
      showLoading: !isLoadMore,
      action: () async {
        final res = await _listNotificationRequestUseCase.execute(request);
        listNotification.addAll(res.data);
        page = request.pageIndex;
        AppData.instance.totalUnread.value = res.totalUnread;
      },
    );
  }

  NotificationListRequest _buildRequest({
    bool isLoadMore = false,
  }) {
    return NotificationListRequest(
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: AppConst.largePageSize,
    );
  }

  Future<void> onLoadMore() async {
    await fetchListNotification(isLoadMore: true);
    refreshController.loadComplete();
  }

  Future<void> onRefresh() async {
    selectedID.clear();
    listNotification.clear();
    await fetchListNotification();
    refreshController.refreshCompleted();
  }

  Future<void> deleteListNotification() async {
    return buildState(
      showLoadingOverlay: true,
      action: () async {
        final response =
            await _deleteListNotificationUseCase.execute(selectedID.toList());
        if (response) {
          isShowCheckbox.value = false;
          listNotification.clear();
          fetchListNotification();
        }
      },
    );
  }
}
