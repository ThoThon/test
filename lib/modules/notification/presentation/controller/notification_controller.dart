import 'package:get/get.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/generated/locales.g.dart';
import 'package:v_bhxh/shares/date/date_utils.dart';

import '../../../../../clean/core/presentation/controllers/base_get_cl_controller.dart';
import '../../../../../core/values/const.dart';
import '../../../../../shares/function/function.src.dart';
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
    if (!isLoadMore) {
      isLoading.value = false;
    }
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

  String timeAgo(DateTime createDate) {
    final now = DateTime.now();
    final difference = now.difference(createDate);

    if (difference.inSeconds < 60) {
      return '${difference.inSeconds} ${LocaleKeys.notification_secondBefore.tr}';
    } else if (difference.inMinutes < 60) {
      return '${difference.inMinutes} ${LocaleKeys.notification_minuteBefore.tr}';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} ${LocaleKeys.notification_hourBefore.tr}';
    } else if (difference.inDays < 7) {
      return '${difference.inDays} ${LocaleKeys.notification_dayBefore.tr}';
    } else {
      return convertDateToString(createDate, PATTERN_1);
    }
  }

  Future<void> deleteListNotification() async {
    try {
      final response =
          await _deleteListNotificationUseCase.execute(selectedID.toList());
      if (response) {
        isShowCheckbox.value = false;
        listNotification.clear();
        fetchListNotification();
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
