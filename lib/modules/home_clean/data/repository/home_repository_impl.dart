import 'package:v_bhxh/clean/core/data/model/base_response_cl.dart';
import 'package:v_bhxh/modules/home_clean/domain/repository/home_repository.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';

class HomeRepositoryImpl extends HomeRepository {
  final AuthAppServerApiClient _authAppServerApiClient;

  HomeRepositoryImpl(this._authAppServerApiClient);

  @override
  Future<bool> realAllNotification() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlReadAllNotification,
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }

  @override
  Future<int> getUnreadNotificationCount() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetNotificationUnread,
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl<int>.fromJson(response);

    return data.result ?? 0;
  }
}
