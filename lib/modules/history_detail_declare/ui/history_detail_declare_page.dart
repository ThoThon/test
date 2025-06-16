import 'package:timelines_plus/timelines_plus.dart';

import '../../src.dart';

part 'history_detail_declare_widget.dart';

class HistoryDetailDeclarePage extends BaseGetWidget {
  HistoryDetailDeclarePage({super.key});

  @override
  HistoryDetailDeclareController get controller => _controller;

  late final _controller = Get.put(HistoryDetailDeclareController());

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
