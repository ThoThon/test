import 'package:v_bhxh/modules/src.dart';

part 'declare_info_630c_widget.dart';

class DeclareInfo630cPage extends BaseGetWidget {
  const DeclareInfo630cPage({super.key});
  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: BaseAppBar(
          title: BaseAppBarTitle(
            title: 'Thủ tục 630c'
          ),
          leading: UtilWidget.buildButtonBackAppbar(),
          centerTitle: true,
        ),
        body: SafeArea(
          child: _buildBody(),
        ),
      ),
    );
  }
}
