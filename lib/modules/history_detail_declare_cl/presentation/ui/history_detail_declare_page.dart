import 'package:timelines_plus/timelines_plus.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/base_get_page.dart';

import '../../../src.dart';
import '../controller/history_detail_declare_controller.dart';

part 'history_detail_declare_widget.dart';

class HistoryDetailDeclarePage
    extends BaseGetPage<HistoryDetailDeclareController> {
  HistoryDetailDeclarePage({super.key});

  @override
  Widget buildPage(BuildContext context) {
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
        body: BaseCardBody(
          child: _buildBody(),
        ),
      ),
    );
  }
}
