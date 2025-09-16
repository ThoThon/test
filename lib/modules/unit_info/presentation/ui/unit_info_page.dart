import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/shares/utils/string_utils.dart';

import '../../../../clean/core/presentation/widgets/widget_src.dart';
import '../../../src.dart';

part 'unit_info_ext_input.dart';
part 'unit_info_ext_view.dart';

class UnitInfoPage extends BaseGetPage<UnitInfoController> {
  UnitInfoPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
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
          child: Obx(
            () {
              if (controller.isEditAll.value) {
                return _buildBodyInput();
              }
              return _buildBodyView();
            },
          ),
        ),
      ),
    );
  }
}
