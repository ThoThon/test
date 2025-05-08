import 'package:timelines_plus/timelines_plus.dart';

import '../../src.dart';

part 'history_register_detail_widget.dart';

class HistoryRegisterDetailPage extends BaseGetWidget {
  HistoryRegisterDetailPage({super.key});

  @override
  HistoryRegisterDetailControllerICare get controller => _controller;

  late final _controller = Get.put(HistoryRegisterDetailControllerICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(title: LocaleKeys.historyRegister_historyDetail.tr),
      body: baseShowLoading(
        () => _buildBody(),
      ),
    );
  }
}
