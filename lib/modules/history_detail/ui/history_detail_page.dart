import 'package:timelines_plus/timelines_plus.dart';
import 'package:v_bhxh/modules/history/models/model_src.dart';

import '../../src.dart';

part 'history_detail_widget.dart';

class HistoryDetailPage extends BaseGetWidget {
  HistoryDetailPage({super.key});

  @override
  HistoryDetailController get controller => _controller;

  late final _controller = Get.put(HistoryDetailController());

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
