import 'package:v_bhxh/modules/declare/procedure_list/controller/controller_src.dart';
import 'package:v_bhxh/modules/src.dart';

part 'procedure_list_widget.dart';

class ProcedureListPage extends BaseGetWidget<ProcedureListController> {
  ProcedureListPage({super.key});

  @override
  ProcedureListController get controller => _controller;

  late final _controller = Get.put(ProcedureListController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: TextUtils(text: 'Danh sách thủ tục'),
      ),
      body: _buildBody(),
    );
  }
}
