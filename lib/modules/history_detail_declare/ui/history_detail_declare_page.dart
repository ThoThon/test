import 'package:timelines_plus/timelines_plus.dart';

import '../../history/history_src.dart';
import '../../src.dart';

part 'history_detail_declare_widget.dart';

class HistoryDetailDeclarePage extends BaseGetWidget {
  HistoryDetailDeclarePage({super.key});

  @override
  HistoryDetailDeclareController get controller => _controller;

  late final _controller = Get.put(HistoryDetailDeclareController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          leading:
              UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
          backgroundColor: AppColors.primaryColor,
          title: BaseAppBarTitle(
            title: LocaleKeys.history_lookup.tr,
            textColor: AppColors.basicWhite,
          ),
          centerTitle: true,
        ),
        body: buildLoadingOverlay(
          () => BaseCardBody(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
