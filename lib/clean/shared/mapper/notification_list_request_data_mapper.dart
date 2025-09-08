import 'package:v_bhxh/clean/shared/mapper/mapper_src.dart';

import '../../../modules/notification/notification_src.dart';

class NotificationListRequestDataMapper extends BaseEntityMapper<
    NotificationListRequest, NotificationListRequestData> {
  @override
  NotificationListRequestData mapToData(NotificationListRequest entity) {
    return NotificationListRequestData(
      pageIndex: entity.pageIndex,
      pageSize: entity.pageSize,
    );
  }
}
