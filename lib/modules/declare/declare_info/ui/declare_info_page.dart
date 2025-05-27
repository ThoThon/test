import 'package:collection/collection.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/modules/declare/declare_info/ui/select_hospital_bts.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';

part 'd01_tab_widget.dart';
part 'd02_tab_widget.dart';
part 'declare_info_widget.dart';
part 'tk1_tab_widget.dart';

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
