import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';
import '../notification_src.dart';

class NotificationController extends BaseRefreshGetxController {
  late final notificationRepository = NotificationRepository(this);

  final listNotification = <NotificationItemModel>[].obs;

  int page = AppConst.defaultPageNumber;

  // Future<void> fetchListNotification({bool isLoadMore = false}) async {
  //   if (!isLoadMore) {
  //     showLoading();
  //   }
  //   try {
  //     final res = await notificationRepository.fetchNotification(
  //       pageIndex: isLoadMore ? page + 1 : AppConst.defaultPageNumber,
  //       pageSize: AppConst.defaultPageSize,
  //     );
  //     if (res.result != null && res.isSuccess) {
  //       listNotification.addAll(res.result!.data);
  //     }
  //   } catch (e) {
  //     logger.d(e);
  //   } finally {
  //     hideLoading();
  //   }
  // }

  Future<void> readNotification(String id) async {
    try {
      final res = await notificationRepository.readNotification(id);
      if (res.result != null && res.isSuccess) {
        // fetchListNotification(isLoadMore: true);
        update();
      }
    } catch (e) {
      logger.d(e);
    }
  }

  @override
  Future<void> onLoadMore() async {
    // await fetchListNotification(isLoadMore: true);
    refreshController.loadComplete();
  }

  @override
  Future<void> onRefresh() async {
    listNotification.clear();
    // await fetchListNotification();
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

  // void onTapReadNoti(){
  //   final notification
  // }
}
