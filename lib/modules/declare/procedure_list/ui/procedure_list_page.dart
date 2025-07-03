import 'package:v_bhxh/modules/src.dart';

part 'procedure_list_widget.dart';

class ProcedureListPage extends BaseGetWidget<ProcedureListController> {
  ProcedureListPage({super.key});

  @override
  ProcedureListController get controller => _controller;

  late final _controller = Get.put(ProcedureListController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Container(
      color: AppColors.primaryColor,
      child: Scaffold(
        appBar: BaseAppBar(
          title: BaseAppBarTitle(
            title: LocaleKeys.procedureList_pageTitle.tr,
            textColor:
                AppColors.basicWhite
          ),
          centerTitle: true,
          leading: UtilWidget.buildButtonBackAppbar(
            color: AppColors.basicWhite,
          ),
          backgroundColor: AppColors.primaryColor,
        ),
        body: BaseCardBody(
          child: _buildBody(),
        ),
      ),
    );
  }
}
