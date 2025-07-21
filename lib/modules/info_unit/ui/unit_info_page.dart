import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
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
      child: buildLoadingOverlay(
        () => Scaffold(
          appBar: BaseAppBar(
            backgroundColor: AppColors.primaryColor,
            centerTitle: true,
            leading: UtilWidget.buildButtonBackAppbar(
                color: AppColors.basicWhite,
                onTap: () {
                  controller.fetchDataAccountInfo();
                  Get.offAllNamed(
                    AppRoutes.home.path,
                  );
                }),
            title: BaseAppBarTitle(
              title: LocaleKeys.unitInfo_unitInfo.tr,
              textColor: Colors.white,
            ),
          ),
          body: BaseCardBody(
            child: _buildBody(),
          ),
        ),
      ),
    );
  }
}
