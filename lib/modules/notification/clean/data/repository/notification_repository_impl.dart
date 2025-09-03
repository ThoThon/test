import 'package:v_bhxh/modules/notification/clean/domain/entity/list_notification.dart';
import 'package:v_bhxh/modules/notification/clean/domain/entity/list_notification_request.dart';

import '../../../../../clean/core/data/data_source/network/auth_app_server_api_client.dart';
import '../../domain/repository/notification_repository.dart';

class NotificationRepositoryImpl extends NotificationRepository {
  final AuthAppServerApiClient _authAppServerApiClient;

  @override
  Future<ListNotification> fetchNotification({
    required ListNotificationRequest request,
  }) {
    throw UnimplementedError();
  }

  @override
  Future<bool> deleteListNotification({required List<String> id}) {
    // TODO: implement deleteListNotification
    throw UnimplementedError();
  }

  @override
  Future<ListNotification> getListNotification(
      {required ListNotificationRequest request}) {
    // TODO: implement getListNotification
    throw UnimplementedError();
  }
}
