import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:v_bhxh/base_app/model/app_data.dart';
import 'package:v_bhxh/modules/declare_info_630c/controller/declare_info_630c_controller.dart';
import 'package:v_bhxh/modules/login/model/categories_630/bank_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/benefit_group_630b_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/declare_form_model.dart';
import 'package:v_bhxh/modules/login/model/categories_630/receive_form_model.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/utils/utils_src.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

part 'declare_info_630c_widget.dart';
part 'benefit_account_info_group_ext_630c.dart';
part 'declare_info_group_ext_630c.dart';
part 'person_info_group_ext_630c.dart';
class DeclareInfo630cPage extends BaseGetWidget {
  @override
  DeclareInfo630cController get controller => _controller;

  late final _controller = Get.put(DeclareInfo630cController());
  DeclareInfo630cPage({super.key});
  @override
  Widget buildWidgets(BuildContext context) {
    return buildLoadingOverlay(
      () => Scaffold(
        appBar: BaseAppBar(
          title: const BaseAppBarTitle(title: 'Thủ tục 630c'),
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
