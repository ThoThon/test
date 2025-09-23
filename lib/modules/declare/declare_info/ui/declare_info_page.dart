import 'package:collection/collection.dart';
import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/clean/shared/entity/entity_src.dart';
import 'package:v_bhxh/modules/declare/declare_info/clean/domain/entity/select_ward_argument.dart';
import 'package:v_bhxh/modules/declare/family_member_detail/domain/entity/family_member.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../../clean/core/presentation/navigation/navigation_src.dart';
import '../../../../clean/shared/utils/get_finder.dart';
import '../../family_member_detail/domain/entity/birth_type_enum.dart';
import '../clean/presentation/select_ward_bts.dart';

part 'd01_tab_widget.dart';
part 'd02_tab_widget.dart';
part 'declare_info_widget.dart';
part 'tk1_tab_widget.dart';

class DeclareInfoPage extends BaseGetWidget<DeclareInfoController> {
  DeclareInfoPage({super.key});

  @override
  DeclareInfoController get controller => _controller;

  late final _controller = Get.put(DeclareInfoController());

  // TODO: Sau khi clean thì nhớ xóa
  late final nav = sl<AppNavigator>();

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
