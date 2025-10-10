import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/clean/core/presentation/widgets/widget_src.dart';
import 'package:v_bhxh/clean/shared/entity/categories_630/categories_630_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../../../../clean/shared/entity/category.dart';
import '../../declare_info_630c_src.dart';

part 'benefit_account_info_group_ext_630c.dart';
part 'declare_info_630c_widget.dart';
part 'declare_info_group_ext_630c.dart';
part 'person_info_group_ext_630c.dart';

class DeclareInfo630cPage extends BaseGetPage<DeclareInfo630cController> {
  DeclareInfo630cPage({super.key});

  @override
  Widget buildPage(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        title: BaseAppBarTitle(
          title: LocaleKeys.declareInfo_title630c.tr,
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
