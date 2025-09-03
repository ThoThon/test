import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class ListNotificationRequest implements Entity {
  final int pageIndex;
  final int pageSize;

  ListNotificationRequest({
    required this.pageIndex,
    required this.pageSize,
  });
}
