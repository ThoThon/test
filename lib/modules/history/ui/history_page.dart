import 'package:v_bhxh/clean/routes/app_routes_cl.dart';

import '../../src.dart';

part 'history_declare_tab.dart';
part 'history_register_tab.dart';
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
          backgroundColor: AppColors.basicWhite,
          leading: UtilWidget.buildButtonBackAppbar(
            onTap: () {
              controller.backToHome();
            },
          ),
          centerTitle: true,
          title: BaseAppBarTitle(
            title: LocaleKeys.history_title.tr,
          ),
          // actions: [
          //   _buildActionSelectMonth(),
          // ],
        ),
        body: _buildBody(),
      ),
    );
  }
}
