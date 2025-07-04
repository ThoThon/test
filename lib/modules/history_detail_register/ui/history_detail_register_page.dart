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
