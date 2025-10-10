import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';

import '../../../../base_app/base_app.src.dart';
import '../../../../clean/shared/entity/category.dart';
import '../../../../shares/widgets/keyboard/keyboard.dart';
import '../../../declare_info_630a/declare_info_630a_src.dart';

part 'benefit_account_info_group_ext_630b.dart';
part 'declare_info_630b_widget.dart';
part 'declare_info_group_ext_630b.dart';
part 'person_info_group_ext_630b.dart';

class DeclareInfo630bPage extends BaseGetPage<DeclareInfo630bController> {
  DeclareInfo630bPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        leading: UtilWidget.buildButtonBackAppbar(),
        title: BaseAppBarTitle(
          title: LocaleKeys.declareInfo_title630b.tr,
        ),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
