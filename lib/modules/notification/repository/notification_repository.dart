import 'package:v_bhxh/base_app/base_app.src.dart';
import 'package:v_bhxh/modules/src.dart';

class NotificationRepository extends BaseRepository {
  NotificationRepository(super.controller);

  Future<BaseResponse> readNotification(String id) async {
    final response = await baseCallApi(
      AppApi.urlReadNotification,
      EnumRequestMethod.post,
      jsonMap: {'id': id},
      isQueryParametersPost: true,
    );
    logger.d(response);
    return BaseResponse.fromJson(response);
  }
}
