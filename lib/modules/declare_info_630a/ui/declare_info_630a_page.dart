import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/modules/src.dart';

import '../../../shares/widgets/keyboard/keyboard.dart';
import '../../login/model/district_model.dart';

part 'declare_info_630a_widget.dart';

class DeclareInfo630aPage extends BaseGetWidget {
  DeclareInfo630aPage({super.key});

  @override
  DeclareInfo630aController get controller => _controller;

  late final _controller = Get.put(DeclareInfo630aController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          // title: controller.argument.procedureType.declareInfoTitle,
          title: LocaleKeys.declareInfo_title630a.tr,
        ),
        leading: UtilWidget.buildButtonBackAppbar(),
        centerTitle: true,
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
