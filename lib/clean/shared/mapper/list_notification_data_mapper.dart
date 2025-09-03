import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';
import 'package:v_bhxh/modules/notification/clean/data/model/list_notification_data.dart';
import 'package:v_bhxh/modules/notification/clean/domain/entity/list_notification.dart';

class ListNotificationDataMapper
    extends BaseDataMapper<ListNotificationData, ListNotification> {
  @override
  ListNotification mapToEntity(ListNotificationData? data) {
    return ListNotification(
      data: data?.data ?? [],
      total: data?.total ?? 0,
      totalUnread: data?.totalUnread ?? 0,
    );
  }
}
