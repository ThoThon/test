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
          LocaleKeys.historyRegister_historyTransaction.tr,
          style: AppTextStyle.font16Bo,
        ),
      ),
      body: _buildBody(),
    );
  }
}
