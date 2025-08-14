import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:tiengviet/tiengviet.dart';

import '../../src.dart';

part 'other_info_widget.dart';

class OtherInfoPage extends BaseGetWidget {
  OtherInfoPage({super.key});
  @override
  OtherInfoController get controller => _controller;
  late final _controller = Get.put(OtherInfoController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.primaryColor,
          title: BaseAppBarTitle(
            title: LocaleKeys.otherInfo_title.tr,
            textColor: AppColors.basicWhite,
          ),
          leading:
              UtilWidget.buildButtonBackAppbar(color: AppColors.basicWhite),
          centerTitle: true,
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
