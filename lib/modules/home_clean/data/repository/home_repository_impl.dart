import 'package:v_bhxh/clean/core/data/model/base/base_response_cl.dart';
import 'package:v_bhxh/modules/home_clean/domain/repository/home_repository.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../../clean/core/data/data_source/network/network_src.dart';

class HomeRepositoryImpl extends HomeRepository {
  final AuthAppServerApiClient _authAppServerApiClient;

  HomeRepositoryImpl(this._authAppServerApiClient);

  @override
  Future realAllNotification() async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.post,
      path: AppApi.urlReadAllNotification,
      cancelToken: cancelToken,
    );

    final data = BaseResponseCl.fromJson(response);
    return data.result ?? false;
  }
}
