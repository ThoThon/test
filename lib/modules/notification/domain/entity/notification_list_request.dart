import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class NotificationListRequest implements Entity {
  final int pageIndex;
  final int pageSize;

  NotificationListRequest({
    required this.pageIndex,
    required this.pageSize,
  });
}
