import 'package:flutter_form_registry/flutter_form_registry.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:v_bhxh/base_app/model/base_model.src.dart';
import 'package:v_bhxh/modules/login/model/model_src.dart';
import 'package:v_bhxh/modules/src.dart';
import 'package:v_bhxh/shares/widgets/dialog/dialog_utils.dart';
import 'package:v_bhxh/shares/widgets/keyboard/keyboard.dart';

import '../model/model_src.dart';

part 'family_member_detail_widget.dart';

class FamilyMemberDetailPage
    extends BaseGetWidget<FamilyMemberDetailController> {
  FamilyMemberDetailPage({super.key});

  @override
  FamilyMemberDetailController get controller => _controller;

  late final _controller = Get.put(FamilyMemberDetailController());

  @override
  Widget buildWidgets(BuildContext context) {
    return Scaffold(
      appBar: BaseAppBar(
        centerTitle: true,
        title: BaseAppBarTitle(
          title: LocaleKeys.familyMember_title.tr,
        ),
        leading: UtilWidget.buildButtonBackAppbar(),
      ),
      body: SafeArea(
        child: _buildBody(),
      ),
    );
  }
}
