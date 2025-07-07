import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/birth_type_enum.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/model/family_member.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/controller/declare_info_607_controller.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

part 'declare_info_607_widget.dart';
part 'tk1_tab_607_widget.dart';
part 'd01_tab_607_widget.dart';

class DeclareInfo607Page extends BaseGetWidget<DeclareInfo607Controller> {
  DeclareInfo607Page({super.key});

  @override
  DeclareInfo607Controller get controller => _controller;

  late final _controller = Get.put(DeclareInfo607Controller());

  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: BaseAppBar(
          title: BaseAppBarTitle(
            title: LocaleKeys.declareInfo_title.tr,
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
