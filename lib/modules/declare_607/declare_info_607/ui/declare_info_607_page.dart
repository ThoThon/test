import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/birth_type_enum.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/family_member.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/controller/declare_info_607_controller.dart';
import 'package:v_bhxh/modules/declare_607/declare_info_607/model/model_src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

part 'd01_tab_607_widget.dart';
part 'declare_info_607_widget.dart';
part 'tk1_tab_607_widget.dart';

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
            title: controller.argument.procedureType.declareInfoTitle,
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
