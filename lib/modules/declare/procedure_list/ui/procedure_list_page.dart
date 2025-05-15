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
        title: BaseAppBarTitle(title: LocaleKeys.procedureList_pageTitle.tr),
      ),
      body: SafeArea(child: _buildBody()),
    );
  }
}
