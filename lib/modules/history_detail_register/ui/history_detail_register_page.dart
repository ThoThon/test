import 'package:timelines_plus/timelines_plus.dart';
import 'package:v_bhxh/modules/history_detail_register/controller/history_detail_register_controller.dart';
import 'package:v_bhxh/modules/src.dart';

part 'history_detail_register_widget.dart';

class HistoryDetailRegisterPage extends BaseGetWidget {
  HistoryDetailRegisterPage({super.key});

  @override
  HistoryDetailRegisterController get controller => _controller;

  late final _controller = Get.put(HistoryDetailRegisterController());
  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: SDSBuildText(
          LocaleKeys.history_historyDetail.tr,
          style: AppTextStyle.font16Bo,
        ),
      ),
      body: buildLoadingOverlay(
        () => _buildBody(),
      ),
    );
  }
}
