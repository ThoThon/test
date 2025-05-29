import 'package:v_bhxh/modules/src.dart';

part 'declaration_form_detail_widget.dart';

class DeclarationFormDetailPage
    extends BaseGetWidget<DeclarationFormDetailController> {
  DeclarationFormDetailPage({super.key});

  @override
  DeclarationFormDetailController get controller => _controller;

  late final _controller = Get.put(DeclarationFormDetailController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.declarationFormDetail_title.tr,
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
