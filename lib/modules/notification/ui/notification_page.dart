import 'package:v_bhxh/modules/declaration_tax_code/ui/ui_src.dart';
part 'notification_widget.dart';

class NotificationPage extends BaseGetWidget {
  const NotificationPage({super.key});

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: SDSBuildText(
          "Thông báo",
          style: AppTextStyle.font16Bo,
        ),
        actions: [
          Icon(Icons.check_outlined),
          sdsSBWidth16,
        ],
        centerTitle: true,
      ),
      body: _buildBody(),
    );
  }
}
