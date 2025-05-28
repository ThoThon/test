import 'dart:io';

import 'package:v_bhxh/modules/declare/staff_list/model/model_src.dart';
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
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.staffList_title.tr,
        ),
      ),
      body: SafeArea(
        child: baseShowLoading(() => _buildBody()),
      ),
    );
  }
}
