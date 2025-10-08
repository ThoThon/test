import 'package:timelines_plus/timelines_plus.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/base_get_page.dart';

import '../../../src.dart';

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
          leading: UtilWidget.buildButtonBackAppbar(
            color: AppColors.basicWhite,
            onTap: () {
              nav.back(result: controller.hasLookup);
            },
          ),
          backgroundColor: AppColors.primaryColor,
          title: BaseAppBarTitle(
            title: LocaleKeys.history_lookup.tr,
            textColor: AppColors.basicWhite,
          ),
          centerTitle: true,
        ),
        body: BaseCardBody(
          child: Obx(
            () => _buildBody(),
          ),
        ),
      ),
    );
  }
}
