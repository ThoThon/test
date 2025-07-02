import 'package:dotted_border/dotted_border.dart';
import 'package:easy_debounce/easy_throttle.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/action_popup_staff_enum.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/declared_staff_model.dart';
import 'package:v_bhxh/modules/src.dart';

import '../controller/controller_src.dart';

part 'staff_list_widget.dart';

class StaffListPage extends BaseGetWidget<StaffListController> {
  StaffListPage({super.key});

  @override
  StaffListController get controller => _controller;

  late final _controller = Get.put(StaffListController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: BaseAppBar(
          backgroundColor: AppColors.primaryColor,
          title: BaseAppBarTitle(
            title: LocaleKeys.staffList_title.tr,
            textStyle:
                AppTextStyle.font18Bo.copyWith(color: AppColors.basicWhite),
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
