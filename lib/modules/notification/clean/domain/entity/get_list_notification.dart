import 'package:v_bhxh/clean/core/domain/entity/entity.dart';

class GetListNotification implements Entity{
  final int pageIndex;
  final int pageSize;

  GetListNotification({
    required this.pageIndex,
    required this.pageSize,
  });
}
