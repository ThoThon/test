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

  Future<BaseResponse<NotificationResponse>> fetchNotification(
      NotificationRequest request) async {
    final response = await baseCallApi(
      AppApi.urlGetNotification,
      EnumRequestMethod.get,
      jsonMap: request.toJson(),
    );
    return BaseResponse<NotificationResponse>.fromJson(
      response,
      fromJson: (json) => NotificationResponse.fromJson(json),
    );
  }

  // Lấy số thông báo chưa được đọc
  Future<BaseResponse<int>> getToTalNotiUnread() async {
    final response = await baseCallApi(
      AppApi.urlGetNotificationUnread,
      EnumRequestMethod.get,
    );
    return BaseResponse<int>.fromJson(response);
  }
}
