import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/src.dart';

import '../model/model_src.dart';

class NotificationRepository extends BaseRepository {
  NotificationRepository(super.controller);

  // Đọc 1 thông báo được chỉ định
  Future<BaseResponse> readNotification(String id) async {
    final response = await baseCallApi(
      AppApi.urlReadNotification,
      EnumRequestMethod.post,
      queryParameters: {'id': id},
    );
    return BaseResponse.fromJson(response);
  }

  // Đọc tất cả các thông báo
  Future<BaseResponse> readAllNotification() async {
    final response = await baseCallApi(
      AppApi.urlReadAllNotification,
      EnumRequestMethod.post,
    );
    logger.d(response);
    return BaseResponse.fromJson(response);
  }

  Future<BaseResponse<NotificationModel>> fetchNotification({
    required int pageIndex,
    required int pageSize,
  }) async {
    final response = await baseCallApi(
      AppApi.urlGetNotification,
      EnumRequestMethod.get,
      jsonMap: {
        'pageIndex': pageIndex,
        'pageSize': pageSize,
      },
    );
    return BaseResponse<NotificationModel>.fromJson(
      response,
      fromJson: (json) => NotificationModel.fromJson(json),
    );
  }
}
