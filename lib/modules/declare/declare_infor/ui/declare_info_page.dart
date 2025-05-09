import 'package:v_bhxh/modules/declare/declare_infor/controller/controller_src.dart';
import 'package:v_bhxh/modules/src.dart';

part 'declare_info_widget.dart';

class DeclareInfoPage extends BaseGetWidget<DeclareInfoController> {
  DeclareInfoPage({super.key});

  @override
  DeclareInfoController get controller => _controller;

  late final _controller = Get.put(DeclareInfoController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.declareInfo_title.tr,
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
