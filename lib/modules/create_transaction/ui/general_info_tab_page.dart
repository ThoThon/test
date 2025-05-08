import 'package:v_bhxh/modules/src.dart';

part 'widgets/general_info_tab_widget.dart';

class GeneralInfoTabPage extends BaseGetWidget {
  @override
  TransactionControllerImpICare get controller => _controller;

  late final _controller = Get.put(TransactionControllerImpICare());

  GeneralInfoTabPage({super.key});

  @override
  Widget buildWidgets(BuildContext context) {
    return _buildBody();
  }
}
