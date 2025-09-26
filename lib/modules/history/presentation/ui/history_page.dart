import 'package:flutter/src/widgets/framework.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/routes/app_routes_cl.dart';
import 'package:v_bhxh/modules/history/history_src.dart';
import 'package:v_bhxh/modules/history/presentation/controller/history_controller.dart';

import '../../../src.dart';

part 'history_declare_tab.dart';
part 'history_register_tab.dart';
part 'history_widget.dart';

class HistoryPage extends BaseGetPage<HistoryController> {
  HistoryPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
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
