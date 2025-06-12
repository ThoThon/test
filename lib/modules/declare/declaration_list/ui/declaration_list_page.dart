import 'package:v_bhxh/modules/declare/declaration_list/controller/declaration_list_controller.dart';
import 'package:v_bhxh/modules/declare/declaration_list/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/modules/view_pdf/model/view_pdf_argument.dart';

part 'declaration_list_widget.dart';

class DeclarationListPage extends BaseGetWidget<DeclarationListController> {
  DeclarationListPage({super.key});

  @override
  DeclarationListController get controller => _controller;

  late final _controller = Get.put(DeclarationListController());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: const BaseAppBar(
          title: BaseAppBarTitle(
            title: "Danh sách biểu mẫu tờ khai",
          ),
        ),
        body: SafeArea(
          child: _buildBody(),
        ),
      ),
    );
  }
}
