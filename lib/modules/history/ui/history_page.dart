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
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (didPop) return;
        controller.backToHome();
      },
      child: Scaffold(
        appBar: BaseAppBar(
          leading: BackButton(
            onPressed: () {
              controller.backToHome();
            },
          ),
          title: BaseAppBarTitle(
            title: LocaleKeys.history_historyTransaction.tr,
          ),
        ),
        body: _buildBody(),
      ),
    );
  }
}
