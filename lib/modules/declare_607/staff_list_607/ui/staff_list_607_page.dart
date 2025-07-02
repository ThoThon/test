import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:v_bhxh/modules/declare/staff_list/model/action_popup_staff_enum.dart';
import 'package:v_bhxh/modules/declare_607/staff_list_607/controller/staff_list_607_controller.dart';
import 'package:v_bhxh/modules/declare_607/staff_list_607/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

part 'staff_list_607_widget.dart';

class StaffList607Page extends BaseGetWidget<StaffList607Controller> {
  StaffList607Page({super.key});

  @override
  StaffList607Controller get controller => _controller;

  late final _controller = Get.put(StaffList607Controller());

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
