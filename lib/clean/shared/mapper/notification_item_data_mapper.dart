import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/notification/notification_src.dart';


class NotificationItemDataMapper
    extends BaseDataMapper<NotificationItemData, NotificationItem> {
  @override
  NotificationItem mapToEntity(NotificationItemData? data) {
    return NotificationItem(
      id: data?.id ?? '',
      entityId: data?.entityId ?? '',
      entityType: data?.entityType ?? '',
      notificationObjectId: data?.notificationObjectId ?? '',
      message: data?.message ?? '',
      createDate: data?.createDate ?? DateTime.now(),
      status: data?.status ?? 0,
      name: data?.name ?? '',
      timeAgo: data?.timeAgo ?? '',
      appAction: data?.appAction ?? '',
      typeOfNotification: data?.typeOfNotification ?? 0,
      url: data?.url ?? '',
      notifierId: data?.notifierId ?? '',
    );
  }
}
