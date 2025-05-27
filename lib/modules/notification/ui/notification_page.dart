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
      appBar: const BaseAppBar(
        title: BaseAppBarTitle(
          title: "Thông báo",
        ),
        actions: [
          Icon(
            Icons.check_outlined,
            color: AppColors.primaryColor,
          ),
          sdsSBWidth16,
        ],
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}
