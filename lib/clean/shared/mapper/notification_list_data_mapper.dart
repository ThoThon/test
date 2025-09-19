import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/notification/notification_src.dart';

class NotificationListDataMapper
    extends BaseDataMapper<NotificationListData, NotificationList> {
  final NotificationItemDataMapper _notificationDataMapper;

  NotificationListDataMapper(this._notificationDataMapper);
  @override
  NotificationList mapToEntity(NotificationListData? data) {
    return NotificationList(
      data: _notificationDataMapper.mapToListEntity(data?.data),
      total: data?.total ?? 0,
      totalUnread: data?.totalUnread ?? 0,
    );
  }
}
