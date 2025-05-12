import 'package:v_bhxh/modules/history/models/model_src.dart';

import '../../src.dart';

part 'history_widget.dart';

class HistoryPage extends BaseGetWidget {
  HistoryPage({super.key});

  @override
  HistoryController get controller => _controller;

  late final _controller = Get.put(HistoryController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
        appBar: BaseAppBar(
          title: SDSBuildText(
            LocaleKeys.history_historyTransaction.tr,
            style: AppTextStyle.font16Bo,
          ),
        ),
        body: baseShowLoading(
          () => _buildBody(),
        ));
  }
}
