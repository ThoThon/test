import 'package:v_bhxh/modules/notification/controller/notification_controller.dart';

import '../../../modules/src.dart';
import '../model/model_src.dart';

part 'notification_widget.dart';

class NotificationPage extends BaseGetWidget {
  NotificationPage({super.key});
  @override
  NotificationController get controller => _controller;

  late final _controller = Get.put(NotificationController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: BaseAppBarTitle(
            title: LocaleKeys.pageBuilder_notification.tr,
          ),
          actions: [
            IconButton(
              onPressed: () {
                controller.readAllNotification();
              },
              icon: const Icon(
                Icons.check_outlined,
                color: AppColors.primaryColor,
              ),
            ),
            sdsSBWidth16,
          ],
          centerTitle: true,
        ),
        body: baseShowLoading(_buildBody));
  }
}
