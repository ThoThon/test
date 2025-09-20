import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/modules/other_info/presentation/controller/other_info_controller.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';

import '../../../src.dart';

part 'other_info_widget.dart';

class OtherInfoPage extends BaseGetPage<OtherInfoController> {
  OtherInfoPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        backgroundColor: AppColors.primaryColor,
        title: BaseAppBarTitle(
          title: LocaleKeys.otherInfo_title.tr,
          textColor: AppColors.basicWhite,
        ),
        leading: UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
        centerTitle: true,
      ),
      body: BaseCardBody(
        child: baseShowLoading(
          () => _buildBody(),
        ),
      ),
    );
  }
}
