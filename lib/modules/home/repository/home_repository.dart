import 'package:v_bhxh/base_app/base_app.src.dart';

import '../../src.dart';

class HomeRepository extends BaseRepository {
  HomeRepository(super.controller);

  // Đọc tất cả các thông báo
  Future<BaseResponse> readAllNotification() async {
    final response = await baseCallApi(
      AppApi.urlReadAllNotification,
      EnumRequestMethod.post,
    );
    return BaseResponse.fromJson(response);
  }
}
