import '../../../modules/src.dart';

part 'notification_widget.dart';

class NotificationPage extends BaseGetWidget {
  const NotificationPage({super.key});

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
