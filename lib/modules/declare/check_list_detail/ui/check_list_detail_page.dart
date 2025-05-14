import 'package:v_bhxh/modules/declare/check_list_detail/controller/controller_src.dart';
import 'package:v_bhxh/modules/src.dart';

part 'check_list_detail_widget.dart';

class CheckListDetailPage extends BaseGetWidget<CheckListDetailController> {
  CheckListDetailPage({super.key});

  @override
  CheckListDetailController get controller => _controller;

  late final _controller = Get.put(CheckListDetailController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: controller.argument.action.isCreate
              ? 'Thêm mới bảng kê'
              : controller.argument.checkList?.title ?? '',
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
