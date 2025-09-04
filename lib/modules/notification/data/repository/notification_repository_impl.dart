import 'dart:convert';

import 'package:v_bhxh/clean/core/data/data_source/network/rest_api_client.dart';
import 'package:v_bhxh/clean/shared/mapper/notification_list_data_mapper.dart';
import 'package:v_bhxh/clean/shared/mapper/notification_list_request_data_mapper.dart';

import '../../../../../clean/core/data/data_source/network/auth_app_server_api_client.dart';
import '../../../../../clean/core/data/model/base_response_cl.dart';
import '../../../../../core/values/app_api.dart';
import '../../notification_src.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final AuthAppServerApiClient _authAppServerApiClient;
  final NotificationListDataMapper _notificationListDataMapper;
  final NotificationListRequestDataMapper _notificationListRequestDataMapper;

  NotificationRepositoryImpl(
    this._authAppServerApiClient,
    this._notificationListDataMapper,
    this._notificationListRequestDataMapper,
  );

  @override
  Future<NotificationList> getListNotification({
    required NotificationListRequest request,
  }) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.get,
      path: AppApi.urlGetNotification,
      cancelToken: cancelToken,
      queryParameters:
          _notificationListRequestDataMapper.mapToData(request).toJson(),
    );
    final data = BaseResponseCl<NotificationListData>.fromJson(
      response,
      fromJson: (json) => NotificationListData.fromJson(json),
    );
    return _notificationListDataMapper.mapToEntity(data.result);
  }

  @override
  Future<bool> deleteListNotification({required List<String> ids}) async {
    final response = await _authAppServerApiClient.request(
      method: RestMethod.delete,
      path: AppApi.urlDeleteListNotification,
      cancelToken: cancelToken,
      body: jsonEncode(ids),
    );
    final data = BaseResponseCl<bool>.fromJson(response);
    return data.result ?? false;
  }
}
