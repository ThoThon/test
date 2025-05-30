import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';
import '../notification_src.dart';

class NotificationController extends BaseRefreshGetxController {
  late final _notificationRepository = NotificationRepository(this);

  final listNotification = <NotificationItemModel>[].obs;

  int page = AppConst.defaultPageNumber;

  @override
  void onInit() {
    super.onInit();
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
      pageSize: AppConst.defaultPageSize,
    );
  }

  Future<void> readNotification(String id) async {
    try {
      final res = await _notificationRepository.readNotification(id);
      if (res.result != null && res.isSuccess) {
        update();
      }
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  Future<void> onLoadMore() async {
    await fetchListNotification(isLoadMore: true);
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    listNotification.clear();
    await fetchListNotification();
    _getToTalNotiUnread();
    refreshController.refreshCompleted();
  }

  Future<void> _getToTalNotiUnread() async {
    try {
      final res = await _notificationRepository.getToTalNotiUnread();
      if (res.isSuccess && res.result != null) {
        AppData.instance.totalUnread.value = res.result!;
      }
    } catch (e) {
      logger.d(e);
    }
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

  void readNoti(NotificationItemModel item) {
    // Khi onTap thì đổi status = 2 ở local rồi mới đến call API
    if (item.status == 1) {
      item.status = 2;
      listNotification.refresh();
      if (AppData.instance.totalUnread.value > 0) {
        AppData.instance.totalUnread.value =
            AppData.instance.totalUnread.value - 1;
      }
      readNotification(item.id);
    }
  }

  Future<void> readAllNotification() async {
    try {
      if (AppData.instance.totalUnread.value > 0) {
        final res = await _notificationRepository.readAllNotification();
        if (res.isSuccess) {
          AppData.instance.totalUnread.value = 0;
        }
      }
    } catch (e) {
      logger.d(e);
    }
  }
}
