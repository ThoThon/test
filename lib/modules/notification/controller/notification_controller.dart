import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';
import '../notification_src.dart';

class NotificationController extends BaseRefreshGetxController {
  late final _notificationRepository = NotificationRepository(this);

  final listNotification = <NotificationItemModel>[].obs;

  final isShowCheckbox = false.obs;

  // Dùng kiểu Set để tránh phần tử trùng nhau
  final selectedID = <String>{}.obs;

  int page = AppConst.defaultPageNumber;

  @override
  void onInit() {
    super.onInit();
    readAllNotification();
    fetchListNotification();
  }

  Future<void> fetchListNotification({bool isLoadMore = false}) async {
    if (!isLoadMore) {
      showLoading();
    }
    final request = _buildRequest(isLoadMore: isLoadMore);
    try {
      final res = await _notificationRepository.fetchNotification(request);
      if (res.result != null && res.isSuccess) {
        listNotification.addAll(res.result!.data);
        page = request.pageIndex;
        AppData.instance.totalUnread.value = res.result!.totalUnread;
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  NotificationRequest _buildRequest({
    bool isLoadMore = false,
  }) {
    return NotificationRequest(
      pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
      pageSize: AppConst.largePageSize,
    );
  }

  @override
  Future<void> onLoadMore() async {
    await fetchListNotification(isLoadMore: true);
    refreshController.loadComplete();
  }

  @override
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

  Future<void> readAllNotification() async {
    try {
      if (AppData.instance.totalUnread.value > 0) {
        showLoading();
        final res = await _notificationRepository.readAllNotification();
        if (res.isSuccess) {
          for (var item in listNotification) {
            if (item.status == 1) {
              item.status = 2;
            }
          }
          listNotification.refresh();
          AppData.instance.totalUnread.value = 0;
        }
      }
    } catch (e) {
      logger.d(e);
    } finally {
      hideLoading();
    }
  }

  Future<void> deleteListNotification() async {
    try {
      final response = await _notificationRepository
          .deleteListNotification(selectedID.toList());
      if (response.isSuccess && response.result != null) {
        isShowCheckbox.value = false;
        listNotification.clear();
        fetchListNotification();
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
