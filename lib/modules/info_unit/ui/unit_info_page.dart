import 'package:v_bhxh/shares/utils/utils_src.dart';

import '../../src.dart';

part 'unit_info_widget.dart';

class UnitInfoPage extends BaseGetWidget {
  UnitInfoPage({super.key});

  @override
  UnitInfoControllerImpICare get controller => _controller;

  late final _controller = Get.put(UnitInfoControllerImpICare());

  @override
  Widget buildWidgets(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.primaryColor,
          centerTitle: true,
          leading:
              UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
          title: BaseAppBarTitle(
            title: LocaleKeys.unitInfo_unitInfo.tr,
            textColor: Colors.white,
          ),
        ),
        body: BaseCardBody(
          child: baseShowLoading(
            () => _buildBody(),
          ),
        ),
      ),
    );
  }
}
